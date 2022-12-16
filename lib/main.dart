import 'package:flutter/material.dart';
import 'package:javier_arroyes_btc/controller.dart';
import 'package:javier_arroyes_btc/isar_service.dart';
import 'package:isar/isar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Order List",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Order List"),
        ),
        body: OrderList(),
      ),
    );
  }
}

class OrderList extends StatefulWidget {
  final Controller controller = Controller();
  final IsarService service = IsarService();
  //const OrderList(this.service, {Key? key}) : super(key: key);

  /*
  OrderList({super.key, required this.id, required this.date, required this.open, required this.high, required this.low, required this.close, required this.adjClose, required this.volume});

  Id id = Isar.autoIncrement;
  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;
  final double adjClose;
  final int volume;
  */

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _textController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the date';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _textController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the open';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _textController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the high';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _textController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the low';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _textController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the close';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _textController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the adjClose';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _textController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the volume';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  /*
                  widget.service.saveOrder(Order()..date = _textController.text);
                  widget.service.saveOrder(Order()..open = _textController.text);
                  widget.service.saveOrder(Order()..high = _textController.text);
                  widget.service.saveOrder(Order()..low = _textController.text);
                  widget.service.saveOrder(Order()..close = _textController.text);
                  widget.service.saveOrder(Order()..closeAdj = _textController.text);
                  widget.service.saveOrder(Order()..volume = _textController.text);
                  */

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("New order '${_textController.text}' saved in DB")));
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}