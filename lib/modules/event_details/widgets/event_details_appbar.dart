import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class EventDetailsAppbarWidget extends PreferredSize {
  final String title;
  final VoidCallback onTapBack;
  final VoidCallback onTapAction;

  EventDetailsAppbarWidget(
      {required this.title, required this.onTapBack, required this.onTapAction})
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
                      color: AppTheme.colors.groupBackButton,
                    ),
                    onPressed: () {
                      onTapBack();
                    },
                  ),
                ),
                Text(
                  title,
                  style: AppTheme.textStyles.groupAppBarTitle,
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: AppTheme.colors.groupActionButton,
                      ),
                      onPressed: onTapAction,
                    ))
              ],
            ),
          ),
          preferredSize: Size.fromHeight(60),
        );
}
