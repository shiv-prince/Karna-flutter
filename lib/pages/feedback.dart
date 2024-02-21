import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Lottie.asset('assets/thankyou.json',
                  repeat: true, reverse: false),
            ),
            Center(
              child: const Card(
                elevation: 10,
                margin: EdgeInsets.only(left: 100, right: 100),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Image(
                    image: AssetImage('assets/look.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
