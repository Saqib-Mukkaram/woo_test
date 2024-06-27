import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:shared_preferences/shared_preferences.dart';
import 'package:woo_test/Controllers/SharedPreferencesController.dart';
import 'package:woo_test/Views/Login/Login.dart';
import 'package:woo_test/Views/Orders/Orders.dart';

class Account extends StatelessWidget {
  Account({super.key});

  final _prefs = Get.find<SharedPreferencesController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                  Positioned(
                      bottom: -10,
                      right: -10,
                      child: Container(
                          constraints: BoxConstraints(
                            minHeight: 45,
                            minWidth: 45,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Icon(Icons.edit)))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _prefs.getString('user_name') ?? "Guest User",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            _prefs.getString('user_email') != null
                ? Text(
                    "${_prefs.getString('user_email')}",
                    style: TextStyle(fontSize: 18),
                  )
                : SizedBox(),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("Orders"),
              subtitle: Text('Pighlay neelam sa behta hua yeh samaa'),
              onTap: () {
                Get.to(Orders());
              },
              trailing: Icon(Icons.arrow_forward_ios),
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
    ));
  }
}
