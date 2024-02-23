import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karna_main/constents/colors.dart';
import 'package:karna_main/data/userdata.dart';
import 'package:karna_main/routes/routes_imports.gr.dart';
import 'package:karna_main/widgets/login_field%20copy.dart';

@RoutePage()
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

final UserData udata = Get.put(UserData());
RegExp pnum = RegExp(r'^[0-9]{10}$');
bool isLoading = true;

class _LandingPageState extends State<LandingPage> {
  TextEditingController contact = TextEditingController();
  bool isright = false;

  Future<void> checkUser() async {
    if (udata.userContact != "") {
      try {
        String uri = "https://atrakarnaaapi.000webhostapp.com/checkUser.php";
        var res = await http
            .post(Uri.parse(uri), body: {"contact": udata.userContact});
        var response = jsonDecode(res.body);
        if (response["Success"] == "true") {
          setState(() {
            isLoading = true;
            udata.addnewuser = false;
          });
          // Get.to(() => const MyUserList());
          AutoRouter.of(context).push(const MyUserListRoute());
        } else {
          setState(() {
            isLoading = true;
            udata.addnewuser = true;
          });
          //Get.to(() => const AddUser());
          AutoRouter.of(context).push(const AddUserRoute());
        }
      } catch (e) {
        print("$e error in api");
      }
    } else {
      print("fill all forms");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/bg.png'),
              alignment: Alignment.center,
              opacity: 0.7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const Topbar(),
            const Center(
              child: Text(
                "Project Karna",
                style: TextStyle(fontSize: 40, color: MyColors.headdingColor),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 260,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      "Enter your Contact",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginFieldhome(
                      maxLen: 10,
                      hintText: "contact",
                      controller: contact,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      splashColor: MyColors.background,
                      alignment: Alignment.center,
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(CircleBorder())),
                      color: MyColors.background,
                      onPressed: () async {
                        if (pnum.hasMatch(contact.text)) {
                          setState(() {
                            isLoading = false;
                            udata.userContact = contact.text;
                            checkUser();
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Invalid input! Please enter a 10-digit number.'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      icon: Column(
                        children: [
                          Visibility(
                            visible: isLoading,
                            child: const Icon(
                              Icons.arrow_circle_right_rounded,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                          Visibility(
                            visible: !isLoading,
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: CircularProgressIndicator(
                                color: MyColors.background,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 290,
            ),
            const Center(
              child: Text(
                "Devloped by",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            const Center(
              child: Text(
                "Shivu and Team guided by devi Kannan",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
