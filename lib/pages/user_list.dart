import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:karna_main/constents/colors.dart';
import 'package:karna_main/data/userdata.dart';
import 'package:karna_main/routes/routes_imports.gr.dart';

@RoutePage()
class MyUserList extends StatefulWidget {
  const MyUserList({super.key});

  @override
  State<MyUserList> createState() => _MyUserListState();
}

final UserData udata = Get.put(UserData());

class _MyUserListState extends State<MyUserList> {
  List userdata = [];

  Future<void> getdata() async {
    String uri = "https://atrakarnaaapi.000webhostapp.com/getuser.php";
    try {
      var res =
          await http.post(Uri.parse(uri), body: {"contact": udata.userContact});
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

  // Future<void> deleterow(String contact) async {
  //   try {
  //     String uri = "https://atrakarnaaapi.000webhostapp.com/delete_row.php";
  //     var res = await http.post(Uri.parse(uri), body: {"contact": contact});
  //     var response = jsonDecode(res.body);
  //     if (response["Success"] == "true") {
  //       // print("record deleted");
  //       getdata();
  //     } else {
  //       //print("failed try again");
  //     }
  //   } catch (e) {
  //     //print(e);
  //   }
  // }

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
                          "User List",
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
                      height: 550,
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
                                udata.onclickname = userdata[index]["u_name"];
                                udata.onclicknumber =
                                    userdata[index]["u_number"];
                                AutoRouter.of(context)
                                    .push(const SameUserRoute());
                                //Get.to(() => const SameUser(),);
                              },
                              title: Text(
                                " Name  : ${userdata[index]["u_name"]}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: const Icon(Icons.navigate_next_rounded),
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
            "Add New Profile",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          AutoRouter.of(context).push(const AddUserRoute());
          //Get.to(() => const AddUser());
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
