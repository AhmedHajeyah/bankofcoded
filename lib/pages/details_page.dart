import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'User Profile',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: 350,
              height: 150,
              margin: EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color.fromARGB(39, 241, 240, 240).withOpacity(1),
                child: Row(children: [
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                          child: Image.asset('assets/images/logo.png'),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                  SizedBox(
                    width: 70,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 75,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 30,
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Text("welcome"),
                          ),
                          Container(
                            child: Text("name"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("My Balance: "),
                  Container(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text("amount"))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 35),
              child: Container(
                margin: EdgeInsets.only(
                  top: 30,
                ),
                child: Center(
                  child: Row(
                    children: [
                      Center(
                        child: Container(
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    primary: Color.fromARGB(255, 23, 159, 41)),
                                child: Container(
                                  width: 90,
                                  height: 90,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: const Text(
                                      'Deposite',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  primary: Colors.red),
                              child: Container(
                                width: 90,
                                height: 90,
                                alignment: Alignment.center,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Center(
                                  child: const Text(
                                    'Withdraw',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 75,
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: Color.fromARGB(255, 25, 47, 216)),
                    child: Container(
                      width: 90,
                      height: 90,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Center(
                        child: const Text(
                          'Transfer',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    onPressed: () {},
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
