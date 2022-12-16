import 'model.dart';

class Controller {
  List<String> getOrders() {
    return Model().orderList;
  }

  void addOrder(String order) {
    Model().orderList.add(order);
  }
}