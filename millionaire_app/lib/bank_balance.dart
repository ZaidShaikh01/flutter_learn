import 'package:flutter/material.dart';

class BankBalance extends StatelessWidget {
  double balance;
  BankBalance({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Bank Balance: "),
          SizedBox(
            height: 20,
          ),
          Text("\$ $balance",style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,

          ),),
          // OutlinedButton(
          //     onPressed: loadBalance, child: Text("Load balance")),
        ],
      ),
    );
  }
}
