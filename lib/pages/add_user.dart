import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karna_main/constents/colors.dart';
import 'package:karna_main/data/userdata.dart';
import 'package:karna_main/routes/routes_imports.gr.dart';
import 'package:karna_main/widgets/gender.dart';
import 'package:karna_main/widgets/hours_listning.dart';
import 'package:karna_main/widgets/login_field.dart';
import 'package:karna_main/widgets/music_dropdown.dart';

@RoutePage()
class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

final UserData udata = Get.put(UserData());

class _AddUserState extends State<AddUser> {
  TextEditingController collage = TextEditingController();
  TextEditingController cnamprof = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  bool isVisable = false;
  String isstudent = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        backgroundColor: MyColors.background,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Add User",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Gender(),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5, 10, 20, 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Select",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          RadioListTile(
                              activeColor: MyColors.secondarybackground,
                              title: const Text("Student"),
                              value: 'Student',
                              groupValue: isstudent,
                              onChanged: (value) {
                                setState(() {
                                  isstudent = value.toString();
                                  isVisable = true;
                                  udata.userPtof = isstudent;
                                  print(udata.userPtof);
                                });
                              }),
                          RadioListTile(
                              activeColor: MyColors.secondarybackground,
                              title: const Text("Work"),
                              value: 'Work',
                              groupValue: isstudent,
                              onChanged: (value) {
                                setState(() {
                                  isstudent = value.toString();
                                  isVisable = false;
                                  udata.userPtof = isstudent;
                                  print(udata.userPtof);
                                });
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: LoginField(hintText: "Name", controller: name),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: LoginField(hintText: "Age", controller: age),
              ),
              Visibility(
                visible: isVisable,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                  child: LoginField(
                      hintText: "Collage Name", controller: cnamprof),
                ),
              ),
              Visibility(
                visible: !isVisable,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                  child:
                      LoginField(hintText: "Profession", controller: cnamprof),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HourList(),
                    SizedBox(
                      height: 10,
                    ),
                    MusicDrop(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (udata.userGender == '' ||
                        udata.userPtof == '' ||
                        cnamprof.text == '' ||
                        name.text == '' ||
                        age.text == '' ||
                        udata.userhrs == '' ||
                        udata.userMtype == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red.shade800,
                          content: const Text(
                              'Missing input! Please enter all fields.'),
                          duration: const Duration(milliseconds: 2500),
                        ),
                      );
                    } else {
                      udata.userName = name.text;
                      udata.userAge = age.text;
                      udata.userClg = cnamprof.text;
                      AutoRouter.of(context).push(MyPageViewRoute());
                      //Get.to(() => const MyPageView());
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        MyColors.secondarybackground,
                      ),
                      shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      elevation: MaterialStatePropertyAll(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
