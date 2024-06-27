import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
        ),
        body: ListView.builder(
            itemCount: 15,
            itemBuilder: (con, item) {
              return ListTile(
                title: Text("Order $item"),
                subtitle: Text("Order $item"),
              );
            }));
  }
}
