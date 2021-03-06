import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  //Home Screen Page
  TextStyle get title;
  TextStyle get button;
  TextStyle get appBar;
  TextStyle get infoCardTitle;
  TextStyle get infoCardSubtitle1;
  TextStyle get infoCardSubtitle2;
  TextStyle get eventTileTitle;
  TextStyle get eventTileSubtitle;
  TextStyle get eventTileMoney;
  TextStyle get eventTileFriends;

  //Stepper Page
  TextStyle get stepperIndicatorPrimary;
  TextStyle get stepperIndicatorSecondary;
  TextStyle get stepperNextButton;
  TextStyle get stepperNextButtonDisabled;
  TextStyle get stepperNextHighlighted;
  TextStyle get stepperTitlePrimary;
  TextStyle get stepperTitleSecondary;
  TextStyle get stepperHintTextField;
  TextStyle get stepperTextField;
  TextStyle get personTileTitle;
  TextStyle get personTileTitleSelected;
  TextStyle get successPageText;
  TextStyle get successPageValue;
  TextStyle get successPageButton;

  //Group Page
  TextStyle get groupAppBarTitle;
  TextStyle get sectionTitle;
  TextStyle get personName;
  TextStyle get personValuePositive;
  TextStyle get personValueNegative;
  TextStyle get itemName;
  TextStyle get currencySymbol;
  TextStyle get itemValue;
  TextStyle get remainingValue;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.button,
      );

  @override
  TextStyle get title => GoogleFonts.montserrat(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.title,
      );

  @override
  TextStyle get appBar => GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.appBarTitle,
      );

  @override
  TextStyle get infoCardTitle => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.infoCardTitle,
      );

  @override
  TextStyle get infoCardSubtitle1 => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.infoCardSubtitle1,
      );

  @override
  TextStyle get infoCardSubtitle2 => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.infoCardSubtitle2,
      );

  @override
  TextStyle get eventTileFriends => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTileFriends,
      );

  @override
  TextStyle get eventTileMoney => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTileMoney,
      );

  @override
  TextStyle get eventTileSubtitle => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTileSubtitle,
      );

  @override
  TextStyle get eventTileTitle => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.eventTileTitle,
      );

  @override
  TextStyle get stepperIndicatorPrimary => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.stepperIndicatorPrimary,
      );

  @override
  TextStyle get stepperIndicatorSecondary => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.stepperIndicatorSecondary,
      );

  @override
  TextStyle get stepperNextButton => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperNextButton,
      );

  @override
  TextStyle get stepperTitlePrimary => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.stepperTitlePrimary,
      );

  @override
  TextStyle get stepperTitleSecondary => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.stepperTitleSecondary,
      );

  @override
  TextStyle get stepperHintTextField => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.stepperHintTextField,
      );

  @override
  TextStyle get stepperTextField => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperTextField,
      );

  @override
  TextStyle get stepperNextButtonDisabled => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperNextButtonDisabled,
      );

  @override
  TextStyle get groupAppBarTitle => GoogleFonts.montserrat(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.groupAppBarTitle,
      );

  @override
  TextStyle get currencySymbol => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.itemValue,
      );

  @override
  TextStyle get itemName => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.itemName,
      );

  @override
  TextStyle get itemValue => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.itemName,
      );

  @override
  TextStyle get personName => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.personName,
      );

  @override
  TextStyle get personValueNegative => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.personValueNegative,
      );

  @override
  TextStyle get personValuePositive => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.personValuePositive,
      );

  @override
  TextStyle get remainingValue => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.remainingValue,
      );

  @override
  TextStyle get sectionTitle => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.sectionTitle,
      );

  @override
  TextStyle get personTileTitle => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.personTileTitle,
      );

  @override
  TextStyle get personTileTitleSelected => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.personTileTitleSelected,
      );

  @override
  TextStyle get stepperNextHighlighted => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperNextHighlighted,
      );

  @override
  TextStyle get successPageButton => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.successPageText,
      );

  @override
  TextStyle get successPageText => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.successPageText,
      );

  @override
  TextStyle get successPageValue => GoogleFonts.montserrat(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.successPageText,
      );
}
