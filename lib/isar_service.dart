import 'package:isar/isar.dart';
import 'package:javier_arroyes_btc/model.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveOrder(Order newOrder) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.orders.putSync(newOrder));
  }
/*
  Future<void> getOrder(Order existingOrder) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.orders.get(existingOrder.id!));
  }

  Future<void> updateOrder(Order existingOrder) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.orders.putSync(existingOrder.id!));
  }

  Future<void> deleteOrder(Order existingOrder) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.orders.delete(existingOrder.id!));
  }
*/
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [OrderSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}