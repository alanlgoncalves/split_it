import 'package:intl/intl.dart';

const defaultLocale = "pt_BR";

extension MoneyFormatter on double {
  String currencyDecimalSeparator({String locale = defaultLocale}) {
    return NumberFormat.simpleCurrency(locale: locale).symbols.DECIMAL_SEP;
  }

  String currencySymbol({String locale = defaultLocale}) {
    return NumberFormat.simpleCurrency(locale: locale).currencySymbol;
  }

  String simpleCurrency({String locale = defaultLocale}) {
    return NumberFormat.simpleCurrency(locale: locale).format(this);
  }

  String simpleCurrencyWithoutSimbol({String locale = defaultLocale}) {
    return NumberFormat.simpleCurrency(locale: locale)
        .format(this)
        .split(" ")[1];
  }
}
