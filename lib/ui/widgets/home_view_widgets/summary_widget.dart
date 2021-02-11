import 'package:flutter/material.dart';
import 'package:moneymanager/ui/shared/text_styles.dart';
import 'package:moneymanager/ui/shared/ui_helpers.dart';

class SummaryWidget extends StatelessWidget {
  final int Income;
  final int Expense;

  const SummaryWidget({this.Income, this.Expense});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Income', style: summaryTextStyle),
                  UIHelper.verticalSpaceSmall(),
                  Text(Income.toString(), style: summaryNumberTextStyle)
                ],
              ),
              Text(
                '|',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                    fontWeight: FontWeight.w200),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Expenses',
                    style: summaryTextStyle,
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Text(Expense.toString(), style: summaryNumberTextStyle)
                ],
              ),
              Text(
                '|',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                    fontWeight: FontWeight.w200),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Balance',
                    style: summaryTextStyle,
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Text((Income - Expense).toString(),
                      style: summaryNumberTextStyle)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
