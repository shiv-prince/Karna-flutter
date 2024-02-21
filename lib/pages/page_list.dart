import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karna_main/routes/routes_imports.gr.dart';

import 'package:lottie/lottie.dart';

import '../constents/colors.dart';

@RoutePage()
class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        Scaffold(
          backgroundColor: MyColors.background,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, left: 30),
                  child: Lottie.asset('assets/listening-music.json',
                      repeat: true, reverse: true),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0, 20, 30),
                child: Text(
                  "Connect your earphones and set volume based your earing prefrences",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll<double>(10),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(microseconds: 300),
                        curve: Easing.legacy);
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
        Scaffold(
          backgroundColor: MyColors.background,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Lottie.asset('assets/robot.json',
                      repeat: true, reverse: true),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Connect your phone to the headphone jack and connect one side of earphone to the manneqin's dedicated slot",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll<double>(10),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(microseconds: 300),
                        curve: Easing.legacy);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
        Scaffold(
          backgroundColor: MyColors.background,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Lottie.asset('assets/done.json',
                      repeat: true, reverse: true),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "All done start test",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll<double>(10),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () {
                    AutoRouter.of(context).push(const GetDataRoute());
                    //Get.to(() => const ToDataBase());
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
