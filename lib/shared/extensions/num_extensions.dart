import 'package:intl/intl.dart';

extension MoneyFormatter on num {
  String toMoneyString({
    String currency = 'XAF',
    int decimalDigits = 0,
    String customPattern = '#,### \u00a4',
  }) {
    final NumberFormat format = NumberFormat.currency(
      locale: 'fr',
      symbol: currency,
      decimalDigits: decimalDigits,
      customPattern: customPattern,
    );
    return format.format(this);
  }
}
