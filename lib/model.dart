import 'package:isar/isar.dart';

part 'model.g.dart';

@collection
class Order {
  Id id = Isar.autoIncrement;
  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;
  final double adjClose;
  final int volume;

  Order(
      {required this.date,
        required this.open,
        required this.high,
        required this.low,
        required this.close,
        required this.adjClose,
        required this.volume
      });
}

class Model {
  static final Model _model = Model._internal();

  factory Model() {
    return _model;
  }

  Model._internal();

  final List<String> _orderList = <String>[];
  List<String> get orderList => _orderList;

  void addOrder(String order) {
    orderList.add(order);
  }
}
