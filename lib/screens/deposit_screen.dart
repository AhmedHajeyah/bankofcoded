import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart';

class Deposit extends StatefulWidget {
  const Deposit({Key? key}) : super(key: key);

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 68, 68, 68),
        body: Container(
          margin: EdgeInsets.only(top: 20, left: 10),
          child: Column(
            children: [
              TextFormField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    // for below version 2 use this
                    FilteringTextInputFormatter.allow(RegExp(r'[0.0-9.0]')),
// for version 2 and greater youcan also use this
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      labelText: "Deposit Amount",
                      errorStyle: amount.text.isEmpty
                          ? TextStyle(color: Colors.red)
                          : null,
                      hintText: "Enter Amount",
                      icon: Icon(Icons.money_rounded))),
            ],
          ),
        ),
      ),
    );
  }
}
