import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../constents/colors.dart';

@RoutePage()
class RiskNo extends StatelessWidget {
  const RiskNo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
      ),
      backgroundColor: MyColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "No Risk",
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
                      "“Ur Good with the Current values Keep this going for safer ears..”",
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
                    "assets/norisk.png",
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
            )
          ],
        ),
      ),
    );
  }
}
