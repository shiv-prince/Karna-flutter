import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../constents/colors.dart';

@RoutePage()
class RiskYes extends StatelessWidget {
  const RiskYes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
        title: const Text(
          "",
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: MyColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Risk",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 190,
                    child: Text(
                      "“Bad for ears should use less of electronic devices on ears”",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                  ),
                  child: Image.asset(
                    "assets/risk.png",
                    width: 100,
                    height: 100,
                  ),
                )
              ],
            ),
            Container(
              height: 540,
              width: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/info.png'))),
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
