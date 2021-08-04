import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/two/get_users_from_firebase_status.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_controller.dart';
import 'package:split_it/modules/create_split/widgets/person_tile.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  final CreateSplitController controller;

  const StepTwoPage({Key? key, required this.controller}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  late StepTwoController controller;
  late ReactionDisposer _disposer;

  @override
  void initState() {
    this.controller = StepTwoController(controller: widget.controller);
    this.controller.getFriends();

    autorun((_) {
      if (controller.usersStatus == GetUsersFromFirebaseStatus.loading) {
        BotToast.showLoading();
      } else {
        BotToast.closeAllLoading();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _disposer();

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          titleFirstLine: "Com quem",
          titleSecondLine: "você quer dividir?",
        ),
        SizedBox(
          height: 40,
        ),
        StepInputTextWidget(
            hintText: "Nome da pessoa", onChange: controller.onChange),
        SizedBox(
          height: 35,
        ),
        Observer(builder: (_) {
          if (controller.selectedFriends.isEmpty) {
            return Container();
          } else {
            return Column(
              children: [
                ...controller.selectedFriends
                    .map((friend) => PersonTileWidget(
                        friend: friend,
                        isRemovable: true,
                        onPressed: () {
                          controller.removeFriend(friend);
                        }))
                    .toList(),
                SizedBox(
                  height: 35,
                ),
              ],
            );
          }
        }),
        Observer(builder: (_) {
          if (controller.usersStatus == GetUsersFromFirebaseStatus.loading) {
            return Container();
          } else if (controller.usersStatus ==
                  GetUsersFromFirebaseStatus.success &&
              controller.items.isNotEmpty) {
            return Column(
              children: controller.items
                  .map((friend) => PersonTileWidget(
                        friend: friend,
                        onPressed: () {
                          controller.addFriend(friend);
                        },
                      ))
                  .toList(),
            );
          } else {
            if (controller.selectedFriends.isEmpty) {
              return Text("Nenhum amigo(a) encontrado");
            } else {
              return Text("Todos seus amigos foram adicionados 🥳");
            }
          }
        }),
      ],
    );
  }
}
