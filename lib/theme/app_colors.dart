import 'package:flutter/material.dart';

abstract class AppColors {
  // Shared
  Color get backgroundPrimary;
  Color get backgroundSecondary;

  //Home Page
  Color get title;
  Color get infoCardTitle;
  Color get infoCardSubtitle1;
  Color get infoCardSubtitle2;
  Color get button;
  Color get border;
  Color get border2;
  Color get appBarTitle;
  Color get icon;
  Color get iconBackground1;
  Color get iconBackground2;
  Color get eventTileTitle;
  Color get eventTileSubtitle;
  Color get eventTileMoney;
  Color get eventTileFriends;
  Color get divider;

  //Group Page
  Color get stepperIndicatorPrimary;
  Color get stepperIndicatorSecondary;
  Color get stepperBackButton;
  Color get stepperNextButton;
  Color get stepperNextButtonDisabled;
  Color get stepperTitlePrimary;
  Color get stepperTitleSecondary;
  Color get stepperHintTextField;
  Color get stepperTextField;
  Color get inputBorder;

  // Group Page
  Color get groupBackButton;
  Color get groupActionButton;
  Color get groupAppBarTitle;
  Color get groupSpacesDivider;
  Color get groupDivider;
  Color get sectionTitle;
  Color get personName;
  Color get personValuePositive;
  Color get personValueNegative;
  Color get itemName;
  Color get itemValue;
  Color get remainingValue;
  Color get checkboxActive;
  Color get checkboxInactive;
  Color get checkboxBorderActive;
  Color get checkboxBorderInactive;
}

class AppColorsDefault implements AppColors {
  @override
  Color get backgroundPrimary => Color(0xFFFFFFFF);

  @override
  Color get backgroundSecondary => Color(0xFF40b38C);

  @override
  Color get title => Color(0xFF45CC93);

  @override
  Color get button => Color(0xFF666666);

  @override
  Color get infoCardTitle => Color(0xFF666666);

  @override
  Color get border => Color(0xFFDCE0E5);

  @override
  Color get border2 => Color(0xFFFFFFFF);

  @override
  Color get appBarTitle => Color(0xFFFFFFFF);

  @override
  Color get icon => Color(0xFFF5F5F5);

  @override
  Color get iconBackground1 => Color(0xFFE9F8F2);

  @override
  Color get iconBackground2 => Color(0xFFFDECEF);

  @override
  Color get infoCardSubtitle1 => Color(0xFF40B28C);

  @override
  Color get infoCardSubtitle2 => Color(0xFFE83F5B);

  @override
  Color get eventTileFriends => Color(0xFFA4B2AE);

  @override
  Color get eventTileMoney => Color(0xFF666666);

  @override
  Color get eventTileSubtitle => Color(0xFF666666);

  @override
  Color get eventTileTitle => Color(0xFF455250);

  @override
  Color get divider => Color(0xFF666666);

  @override
  Color get stepperIndicatorPrimary => Color(0xFF3CAB82);

  @override
  Color get stepperIndicatorSecondary => Color(0xFF666666);

  @override
  Color get stepperBackButton => Color(0xFF666666);

  @override
  Color get stepperNextButton => Color(0xFF455250);

  @override
  Color get stepperTitlePrimary => Color(0xFF455250);

  @override
  Color get stepperTitleSecondary => Color(0xFF455250);

  @override
  Color get stepperHintTextField => Color(0xFF666666);

  @override
  Color get stepperTextField => Color(0xFF455250);

  @override
  Color get inputBorder => Color(0xFF455250);

  @override
  Color get stepperNextButtonDisabled => Color(0xFF666666);

  @override
  Color get groupActionButton => Color(0xFF455250);

  @override
  Color get groupBackButton => Color(0xFF666666);

  @override
  Color get groupAppBarTitle => Color(0xFF455250);

  @override
  Color get groupSpacesDivider => Color(0xFF455250).withOpacity(0.08);

  @override
  Color get sectionTitle => Color(0xFF455250);

  @override
  Color get itemName => Color(0xFF666666);

  @override
  Color get itemValue => Color(0xFF666666);

  @override
  Color get personName => Color(0xFF666666);

  @override
  Color get personValuePositive => Color(0xFF40B28C);

  @override
  Color get personValueNegative => Color(0xFFE83F5B);

  @override
  Color get remainingValue => Color(0xFFE83F5B);

  @override
  Color get checkboxActive => Color(0xFFE0F3EE);

  @override
  Color get checkboxInactive => Color(0xFFF0F1F1);

  @override
  Color get checkboxBorderActive => Color(0xFFD6D6D6);

  @override
  Color get checkboxBorderInactive => Color(0xFFF0F1F1);

  @override
  Color get groupDivider => Color(0xFF666666).withOpacity(0.2);
}
