import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karna_main/constents/colors.dart';
import 'package:karna_main/data/userdata.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

final UserData udata = Get.put(UserData());

class _GenderState extends State<Gender> {
  String setlected = '';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 15, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
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
                title: const Text("Male"),
                value: 'Male',
                groupValue: setlected,
                onChanged: (value) {
                  setState(() {
                    setlected = value.toString();
                    udata.userGender = setlected;
                    print(udata.userGender);
                  });
                }),
            RadioListTile(
                activeColor: MyColors.secondarybackground,
                title: const Text("Female"),
                value: 'Female',
                groupValue: setlected,
                onChanged: (value) {
                  setState(() {
                    setlected = value.toString();
                    udata.userGender = setlected;
                    print(udata.userGender);
                  });
                })
          ],
        ),
      ),
    );
  }
}
