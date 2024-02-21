import 'package:flutter/material.dart';
import 'package:karna_main/pages/add_user.dart';

class MusicDrop extends StatefulWidget {
  const MusicDrop({super.key});

  @override
  State<MusicDrop> createState() => _MusicDropState();
}

class _MusicDropState extends State<MusicDrop> {
  @override
  Widget build(BuildContext context) {
    String itemvalue = "--select Music Type--";
    return Card(
      color: Colors.white,
      child: DropdownButtonFormField(
          style: TextStyle(color: Colors.black),
          dropdownColor: Colors.white,
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
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          alignment: Alignment.center,
          value: itemvalue,
          items: const [
            DropdownMenuItem<String>(
              value: "--select Music Type--",
              child: Text("--select Music Type--"),
            ),
            DropdownMenuItem<String>(
              value: "Hip hop",
              child: Text("Hip hop"),
            ),
            DropdownMenuItem<String>(
              value: "Classical music",
              child: Text("Classical music"),
            ),
            DropdownMenuItem<String>(
              value: "Rock",
              child: Text("Rock"),
            ),
            DropdownMenuItem<String>(
              value: "Folk",
              child: Text("Folk"),
            ),
          ],
          onChanged: (String? newV) {
            setState(() {
              itemvalue = newV!;
              udata.userMtype = itemvalue;
              print(udata.userMtype);
            });
          }),
    );
  }
}
