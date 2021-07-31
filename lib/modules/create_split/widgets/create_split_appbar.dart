import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitAppbarWidget extends PreferredSize {
  final CreateSplitController controller;
  final int size;

  CreateSplitAppbarWidget({required this.size, required this.controller})
      : super(
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppTheme.colors.stepperBackButton,
                    ),
                    onPressed: controller.backPage,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Observer(
                    builder: (_) {
                      return Text.rich(
                        TextSpan(
                          text: "0${controller.currentPage + 1}",
                          style: AppTheme.textStyles.stepperIndicatorPrimary,
                          children: [
                            TextSpan(
                              text: " - 0$size",
                              style:
                                  AppTheme.textStyles.stepperIndicatorSecondary,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(60),
        );
}
