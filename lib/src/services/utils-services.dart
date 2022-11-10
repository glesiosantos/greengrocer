import 'package:intl/intl.dart';

class UtilsServices {
  String priceToCurrency(double price) =>
      NumberFormat.simpleCurrency(locale: 'pt_BR').format(price);
}
