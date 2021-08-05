import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';

import 'package:split_it/modules/create_split/steps/three/step_three_page.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_page.dart';
import 'package:split_it/modules/create_split/widgets/bottom_stepper_bar.dart';
import 'package:split_it/modules/create_split/widgets/create_split_appbar.dart';
import 'package:split_it/modules/create_split_success/create_split_success_page.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/theme/app_theme.dart';

import 'create_split_status.dart';
import 'steps/one/step_one_page.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller =
      CreateSplitController(firebaseRepository: FirebaseRepository());
  late List<Widget> pages;
  late ReactionDisposer _disposer;

  @override
  void initState() {
    pages = [
      StepOnePage(
        controller: controller,
      ),
      StepTwoPage(
        controller: controller,
      ),
      StepThreePage(
        controller: controller,
      )
    ];

    _disposer = autorun((_) {
      if (controller.status == CreateSplitStatus.success) {
        BotToast.closeAllLoading();

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CreateSplitSuccessPage(controller: controller)));
      } else if (controller.status == CreateSplitStatus.error) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Icon(Icons.warning),
            content: Text(
              "Não foi possível cadastrar esse evento, tente novamente.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (controller.status == CreateSplitStatus.loading) {
        BotToast.showLoading();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _disposer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentPage == 0) {
          return true;
        } else {
          controller.backPage();
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.colors.backgroundPrimary,
        appBar: CreateSplitAppbarWidget(
          context: context,
          controller: controller,
          size: pages.length,
        ),
        body: Observer(
          builder: (_) {
            return pages[controller.currentPage];
          },
        ),
        bottomNavigationBar: SafeArea(
          child: BottomStepperBarWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
