import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:woo_test/Controllers/SharedPreferencesController.dart';

class Account extends StatelessWidget {
  Account({super.key});

  final _prefs = Get.find<SharedPreferencesController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: _prefs.getBool('userLoggedIn') ?? false
            ? SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text("Orders"),
                        subtitle: Text('Pighlay neelam sa behta hua yeh samaa'),
                        onTap: () {
                          // Get.to(Orders());
                        },
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text("Orders"),
                        subtitle: Text('neeli neeli si khamoshiyaam'),
                        onTap: () {
                          // Get.to(Orders());
                        },
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text("Orders"),
                        subtitle: Text('Na Kahi hai Zameen na asmaan'),
                        onTap: () {
                          // Get.to(Orders());
                        },
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text("Orders"),
                        subtitle: Text('Sarsarati hui tehniyaan Patiiyaan'),
                        onTap: () {
                          // Get.to(Orders());
                        },
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text("Orders"),
                        subtitle: Text('Keh Rahi hain bs ik tum ho yahan'),
                        onTap: () {
                          // Get.to(Orders());
                        },
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text("Orders"),
                        subtitle: Text('Asi gehraiyaan asi tanhaaiyaan'),
                        onTap: () {
                          // Get.to(Orders());
                        },
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text("Orders"),
                        subtitle: Text(
                            'aur mei , sirf mei , apnay honay par mujh ko yakeen aagya '),
                        onTap: () {
                          // Get.to(Orders());
                        },
                        trailing: Icon(Icons.arrow_forward_ios),
                      )
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Please Login/Register to view your account"),
                  ElevatedButton(
                    onPressed: () {
                      // Get.to(Login());
                    },
                    child: Text("Login"),
                  )
                ],
              )));
  }
}
