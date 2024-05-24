import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (con, index) => ListTile(
                    title: Text("Item $index"),
                    subtitle: Text("Price: \$${index * 10}"),
                    leading: CircleAvatar(),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                  ))),
    );
  }
}
