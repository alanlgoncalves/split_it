import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_state.dart';
import 'package:split_it/modules/home/widgets/info_card_widget.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  final controller = AppBarController();

  @override
  void initState() {
    controller.getDashboard(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (controller.state.runtimeType) {
      case AppBarStateLoading:
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      case AppBarStateFailure:
        {
          final message = (controller.state as AppBarStateFailure).message;

          return Center(
            child: Text(message),
          );
        }
      case AppBarStateSuccess:
        {
          final dashboard = (controller.state as AppBarStateSuccess).dashboard;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCardWidget(
                value: dashboard.receive,
              ),
              InfoCardWidget(
                value: -dashboard.send,
              )
            ],
          );
        }
      default:
        return Container();
    }
  }
}
