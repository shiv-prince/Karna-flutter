import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:karna_main/data/userdata.dart';

import '../constents/colors.dart';
import '../routes/routes_imports.gr.dart';

@RoutePage()
class SameUser extends StatefulWidget {
  const SameUser({super.key});

  @override
  State<SameUser> createState() => _SameUserState();
}

final UserData udata = Get.put(UserData());
TextEditingController dbvalue = TextEditingController();

class _SameUserState extends State<SameUser> {
  List userdata = [];
  DateTime? date;
  Future<void> getdata() async {
    String uri = "https://atrakarnaaapi.000webhostapp.com/get_table_two.php";
    try {
      var res = await http.post(Uri.parse(uri),
          body: {"contact": udata.onclicknumber, "name": udata.onclickname});
      if (jsonEncode(res.body).isNotEmpty) {
        setState(() {
          userdata = jsonDecode(res.body);
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void checkUserRisk() {
    if ((udata.userhrs.contains("8") && int.parse(dbvalue.text) >= 90) ||
        (udata.userhrs.contains("4") && int.parse(dbvalue.text) >= 95) ||
        (udata.userhrs.contains("2") && int.parse(dbvalue.text) >= 100)) {
      udata.isrisk = "Yes";
      AutoRouter.of(context).push(const RiskYesRoute());
      //Get.to(() => const RiskYes());
    } else {
      udata.isrisk = "No";
      AutoRouter.of(context).push(const RiskNoRoute());
      //Get.to(() => const RiskNo());
    }
  }

  @override
  void initState() {
    setState(() {
      getdata();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: const Text(
          "",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        backgroundColor: MyColors.background,
      ),
      body: userdata.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: MyColors.secondarybackground,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 35, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Test List",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: MyColors.secondarybackground,
                          child: Text(
                            "${userdata.length}",
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 580,
                      width: 500,
                      child: ListView.builder(
                        itemCount: userdata.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Colors.white,
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              onTap: () {
                                // Get.to(() => const SameUser());
                              },
                              title: Text(
                                " Name  : ${userdata[index]["u_name"]}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " Listing  : ${userdata[index]["u_hours"]}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    " Music type  : ${userdata[index]["u_music_type"]}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    " Decibel  : ${userdata[index]["u_decibel"]}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    " Date  : ${userdata[index]["u_test_date"]}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ),
                              //trailing: const Icon(Icons.navigate_next_rounded),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomSheet: Container(
        height: 80,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: MyColors.secondarybackground,
        ),
        child: const Center(
          child: Text(
            "Take New Test",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.white,
        onPressed: () {
          AutoRouter.of(context).push(const SnewDataRoute());
          //Get.to(() => const SnewData());
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add_rounded,
          size: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}
