import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:karna_main/constents/colors.dart';
import 'package:karna_main/data/userdata.dart';
import 'package:karna_main/widgets/hours_listning.dart';
import 'package:karna_main/widgets/login_field%20copy.dart';
import 'package:karna_main/widgets/music_dropdown.dart';

import '../routes/routes_imports.gr.dart';

@RoutePage()
class SnewData extends StatefulWidget {
  const SnewData({super.key});

  @override
  State<SnewData> createState() => _SnewDataState();
}

final UserData udata = Get.put(UserData());
TextEditingController dbvalue = TextEditingController();

class _SnewDataState extends State<SnewData> {
  DateTime? date = DateTime.now();
  Future<void> insertNewuser() async {
    if (dbvalue.text != "") {
      try {
        String uri2 = "https://atrakarnaaapi.000webhostapp.com/table_two.php";
        var res2 = await http.post(Uri.parse(uri2), body: {
          "name": udata.onclickname,
          "contact": udata.onclicknumber,
          "hours": udata.userhrs,
          "music": udata.userMtype,
          "decibel": dbvalue.text,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: MyColors.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: 800,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Set new test values",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const HourList(),
                    const SizedBox(
                      height: 20,
                    ),
                    const MusicDrop(),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginFieldhome(
                        maxLen: 3, hintText: "Decibel", controller: dbvalue),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                MyColors.secondarybackground,
                              ),
                              shape: MaterialStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              elevation: MaterialStatePropertyAll(10)),
                          onPressed: () {
                            setState(() {
                              if (dbvalue.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Missing input! Please enter the Decibel number.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                if (int.parse(dbvalue.text) >= 70 &&
                                    int.parse(dbvalue.text) <= 120) {
                                  date = DateTime.now();
                                  print(DateFormat('yyyy-MM-dd').format(date!));
                                  if ((udata.userhrs.contains("8") &&
                                          int.parse(dbvalue.text) >= 90) ||
                                      (udata.userhrs.contains("4") &&
                                          int.parse(dbvalue.text) >= 95) ||
                                      (udata.userhrs.contains("2") &&
                                          int.parse(dbvalue.text) >= 100)) {
                                    udata.isrisk = "Yes";
                                    setState(() {
                                      insertNewuser();
                                      Navigator.of(context).pop();
                                    });
                                    AutoRouter.of(context)
                                        .push(const RiskYesRoute());
                                    //Get.to(() => const RiskYes());
                                  } else {
                                    udata.isrisk = "No";
                                    setState(() {
                                      insertNewuser();
                                      Navigator.of(context).pop();
                                    });
                                    AutoRouter.of(context)
                                        .push(const RiskNoRoute());
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
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Submit",
                                style: TextStyle(
                                    color: MyColors.headdingColor,
                                    fontSize: 20)),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
