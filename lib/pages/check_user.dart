import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karna_main/pages/add_user.dart';
import 'package:karna_main/pages/user_list.dart';

@RoutePage()
class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 6,
        backgroundColor: const Color.fromARGB(255, 16, 136, 173),
        shadowColor: const Color.fromARGB(255, 16, 136, 173),
        title: const Text(
          "karna",
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Select User type",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Card(
              shadowColor: Colors.green,
              elevation: 15,
              color: Colors.green,
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => const MyUserList(),
                    transition: Transition.rightToLeftWithFade,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 200,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Previous User",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 16, 136, 173),
              shadowColor: const Color.fromARGB(255, 16, 136, 173),
              elevation: 15,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: InkWell(
                onTap: () {
                  Get.to(() => const AddUser(),
                      transition: Transition.rightToLeftWithFade);
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "New User",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
