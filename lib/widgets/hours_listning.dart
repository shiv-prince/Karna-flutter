import 'package:flutter/material.dart';
import 'package:karna_main/pages/add_user.dart';

class HourList extends StatefulWidget {
  const HourList({super.key});

  @override
  State<HourList> createState() => _HourListState();
}

class _HourListState extends State<HourList> {
  String hoursvalue = "--select hours listening--";
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: DropdownButtonFormField(
          dropdownColor: Colors.white,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 7, 46, 49),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          alignment: Alignment.center,
          value: hoursvalue,
          items: const [
            DropdownMenuItem<String>(
              value: "--select hours listening--",
              child: Text("--select hours listening--"),
            ),
            DropdownMenuItem<String>(
              value: "2 hours",
              child: Text("2 hours / day"),
            ),
            DropdownMenuItem<String>(
              value: "4 hours",
              child: Text("4 hours / day"),
            ),
            DropdownMenuItem<String>(
              value: "8 hours+",
              child: Text("8 hours+ / day"),
            ),
          ],
          onChanged: (String? newV) {
            setState(() {
              hoursvalue = newV!;
              udata.userhrs = hoursvalue;
              print(udata.userhrs);
            });
          }),
    );
  }
}
