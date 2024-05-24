import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (con, index) => ListTile(

                  title: Text("Item $index"),


                  subtitle:Text("Price: \$${index * 10}"),



                      // Row(
                      //   children: [
                      //     IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      //     Text("Qty: ${index * 2}"),
                      //     IconButton(
                      //         onPressed: () {},
                      //         icon: Icon(Icons.remove_outlined)),
                      //   ],
                      // )

                  leading: CircleAvatar(),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                  ),
                )));
  }
}
