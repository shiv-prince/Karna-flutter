import 'package:flutter/material.dart';

class Topbar extends StatelessWidget {
  const Topbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/Group.png'),
            alignment: Alignment.center,
            opacity: 0.7),
        color: Color.fromARGB(255, 16, 136, 173),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Color.fromARGB(255, 16, 136, 173),
            spreadRadius: 1.5,
          )
        ],
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Project Karna",
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60, right: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 24,
                          child: Image(
                            image: AssetImage('assets/atria-logo.png'),
                            height: 35,
                            width: 35,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 24,
                          child: Image(
                            image: AssetImage('assets/lions-logo.png'),
                            height: 35,
                            width: 35,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 24,
                          child: Image(
                            image: AssetImage('assets/srcish-logo.jpeg'),
                            height: 35,
                            width: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
