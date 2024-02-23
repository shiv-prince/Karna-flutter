import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:karna_main/data/userdata.dart';
import 'package:karna_main/pages/risk_no.dart';
import 'package:karna_main/pages/risk_yes.dart';
import 'package:karna_main/routes/routes_imports.gr.dart';

import 'package:lottie/lottie.dart';

import '../constents/colors.dart';

@RoutePage()
class ToDataBase extends StatefulWidget {
  const ToDataBase({super.key});

  @override
  State<ToDataBase> createState() => _ToDataBaseState();
}

final UserData udata = Get.put(UserData());
DateTime? date;
TextEditingController db = TextEditingController();

void checkUserRisk() {
  if ((udata.userhrs.contains("8") && int.parse(db.text) >= 90) ||
      (udata.userhrs.contains("4") && int.parse(db.text) >= 95) ||
      (udata.userhrs.contains("2") && int.parse(db.text) >= 100)) {
    udata.isrisk = "Yes";
    Get.to(() => const RiskYes());
  } else {
    udata.isrisk = "No";
    Get.to(() => const RiskNo());
  }
}

Future<void> insertRecord() async {
  if (udata.userDbvalue != "") {
    try {
      String uri = "https://atrakarnaaapi.000webhostapp.com/insert_record.php";
      var res = await http.post(Uri.parse(uri), body: {
        "name": udata.userName,
        "contact": udata.userContact,
        "age": udata.userAge,
        "gender": udata.userGender,
        "domain": udata.userPtof,
        "risk": udata.isrisk,
      });

      String uri2 = "https://atrakarnaaapi.000webhostapp.com/table_two.php";
      var res2 = await http.post(Uri.parse(uri2), body: {
        "name": udata.userName,
        "contact": udata.userContact,
        "hours": udata.userhrs,
        "music": udata.userMtype,
        "decibel": udata.userDbvalue,
        "date": DateFormat('yyyy-MM-dd').format(date!).toString(),
      });

      var response = jsonDecode(res.body);
      var response2 = jsonDecode(res2.body);

      if (response["Success"] == "true" && response2["Success"]) {
        print("record inserted");
      } else {
        print("failed try again");
      }
    } catch (e) {
      print("$e error in api");
    }
  } else {
    print("fill all forms");
  }
}

Future<void> insertNewuser() async {
  if (udata.userDbvalue != "") {
    try {
      String uri2 = "https://atrakarnaaapi.000webhostapp.com/table_two.php";
      var res2 = await http.post(Uri.parse(uri2), body: {
        "name": udata.userName,
        "contact": udata.userContact,
        "hours": udata.userhrs,
        "music": udata.userMtype,
        "decibel": udata.userDbvalue,
        "date": DateFormat('yyyy-MM-dd').format(date!).toString(),
      });

      var response2 = jsonDecode(res2.body);

      if (response2["Success"]) {
        print("record inserted");
      } else {
        print("failed try again");
      }
    } catch (e) {
      print("$e error in api");
    }
  } else {
    print("fill all forms");
  }
}

class _ToDataBaseState extends State<ToDataBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 90),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "WAIT...! for 10sec and entry the value displayed on Manikin Screen...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Lottie.asset('assets/send.json', repeat: true, reverse: true),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    readOnly: true,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    cursorColor: const Color.fromARGB(255, 7, 46, 49),
                    controller: db,
                    decoration: InputDecoration(
                        hintText: udata.userDbvalue.toString(),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      MyColors.secondarybackground,
                    ),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    shadowColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
                  if (udata.userDbvalue.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Missing input! Please enter the Decibel number.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    if (int.parse(udata.userDbvalue) >= 70 &&
                        int.parse(udata.userDbvalue) <= 120) {
                      date = DateTime.now();
                      //print(DateFormat('yyyy-MM-dd').format(date!));
                      if ((udata.userhrs.contains("8") &&
                              int.parse(udata.userDbvalue) >= 90) ||
                          (udata.userhrs.contains("4") &&
                              int.parse(udata.userDbvalue) >= 95) ||
                          (udata.userhrs.contains("2") &&
                              int.parse(udata.userDbvalue) >= 100)) {
                        udata.isrisk = "Yes";
                        insertRecord();
                        AutoRouter.of(context).push(const RiskYesRoute());
                        //Get.to(() => const RiskYes());
                      } else {
                        udata.isrisk = "No";
                        insertRecord();
                        AutoRouter.of(context).push(const RiskNoRoute());
                        //Get.to(() => const RiskNo());
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Wrong input! Please enter the Correct Decibel number.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
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
      ),
    );
  }
}
