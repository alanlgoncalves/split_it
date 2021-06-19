import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/add_button_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

import 'info_card_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback onTapAddButton;

  AppBarWidget({required this.user, required this.onTapAddButton})
      : super(
            child: Stack(
              children: [
                Container(
                  color: AppTheme.colors.backgroundSecondary,
                  height: 240,
                ),
                Column(
                  children: [
                    Container(
                      color: AppTheme.colors.backgroundSecondary,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 62),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              user.photoUrl!,
                            ),
                          ),
                          title: Text(
                            user.name!,
                            style: AppTheme.textStyles.appBar,
                          ),
                          trailing: AddButtonWidget(
                            onTap: onTapAddButton,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoCardWidget(
                          value: 100,
                        ),
                        InfoCardWidget(
                          value: -48,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            preferredSize: Size.fromHeight(298));
}
