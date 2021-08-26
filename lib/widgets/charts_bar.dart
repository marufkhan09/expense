import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 100,
          width: 15,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2.0),
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).errorColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        FittedBox(
          child: Text(
            '\$${spendingAmount.toStringAsFixed(0)}',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
