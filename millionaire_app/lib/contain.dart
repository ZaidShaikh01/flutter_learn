import 'package:flutter/material.dart';
import 'package:millionaire_app/add_money_button.dart';
import 'package:millionaire_app/bank_balance.dart';

class Contain extends StatelessWidget {
  // To take the parementers and funcitons from the paretnt class
  double balance;
  void Function() addMoney;
  Contain({super.key,required this.addMoney,required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.blueGrey[700],
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // This one is to demonstrate how Expanded and flex works

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       flex: 1,
          //       child: Container(
          //         color: Colors.amber,
          //         child: Text("0"),
          //       ),
          //     ),
          //     Expanded(
          //       // TO make this one more bigger
          //       flex: 2,
          //       child: Container(
          //         color: Colors.red,
          //         child: Text("1"),
          //       ),
          //     ),
          //     Expanded(
          //       flex: 1,
          //       child: Container(
          //         color: Colors.black,
          //         child: Text("2"),
          //       ),
          //     )
          //   ],
          // ),

          BankBalance(balance: balance),
          AddMoneyButton(addMoneyFunction: addMoney),
        ],
      ),
    );
  }
}
