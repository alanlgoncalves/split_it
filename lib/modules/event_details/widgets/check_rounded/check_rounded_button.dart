import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/event_details/widgets/check_rounded/check_rounded_controller.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/theme/app_theme.dart';

class CheckRoundedButtonWidget extends StatefulWidget {
  final EventModel event;
  final FriendModel friend;
  final Function(FriendModel friend) onChanged;

  const CheckRoundedButtonWidget(
      {Key? key,
      required this.event,
      required this.friend,
      required this.onChanged})
      : super(key: key);

  @override
  _CheckRoundedButtonWidgetState createState() =>
      _CheckRoundedButtonWidgetState();
}

class _CheckRoundedButtonWidgetState extends State<CheckRoundedButtonWidget> {
  late CheckRoundedController controller;

  Color get checkboxColor => controller.status == CheckRoundedStatus.success
      ? AppTheme.colors.checkboxActive
      : AppTheme.colors.checkboxInactive;

  Color get checkboxBorderColor =>
      controller.status == CheckRoundedStatus.success
          ? AppTheme.colors.checkboxBorderActive
          : AppTheme.colors.checkboxBorderInactive;

  @override
  void initState() {
    controller = CheckRoundedController(
        repository: FirebaseRepository(),
        event: widget.event,
        status: widget.friend.isPaid
            ? CheckRoundedStatus.success
            : CheckRoundedStatus.empty);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: checkboxColor,
          border: Border.fromBorderSide(
            BorderSide(
              width: 1,
              color: checkboxBorderColor,
            ),
          ),
        ),
        child: Checkbox(
          activeColor: Color(0xFF40B38C),
          onChanged: (value) async {
            await controller.update(friend: widget.friend);

            if (controller.status == CheckRoundedStatus.success) {
              widget.onChanged(widget.friend.copyWith(isPaid: true));
            } else if (controller.status == CheckRoundedStatus.empty) {
              widget.onChanged(widget.friend.copyWith(isPaid: false));
            }
          },
          value: controller.status == CheckRoundedStatus.success ? true : false,
        ),
      ),
    );
  }
}
