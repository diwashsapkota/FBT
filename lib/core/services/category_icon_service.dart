import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneymanager/core/models/category.dart';

class CategoryIconService {
  //* FIRST : EXPENSE LIST
  final expenseList = {
    Category(0, "Feed", FontAwesomeIcons.pizzaSlice, Colors.green),
    Category(1, "Livestock", FontAwesomeIcons.truck, Colors.blue),
    Category(2, "Operation", FontAwesomeIcons.tools, Colors.blueAccent),
    Category(3, "Wages", FontAwesomeIcons.moneyBill, Colors.brown),
    Category(4, "Fuel", FontAwesomeIcons.oilCan, Colors.cyanAccent),
    Category(5, "Machinery", FontAwesomeIcons.toolbox, Colors.deepOrange),
    Category(6, "Pet", FontAwesomeIcons.dog, Colors.deepPurpleAccent),
    Category(7, "Insurance", FontAwesomeIcons.hammer, Colors.indigo),
    Category(8, "Telephone", FontAwesomeIcons.phone, Colors.indigoAccent),
    Category(9, "Advertisement", FontAwesomeIcons.microphone, Colors.lime),
    Category(10, "labor", FontAwesomeIcons.watchmanMonitoring, Colors.limeAccent),
    Category(11, "Tax", FontAwesomeIcons.moneyBillAlt, Colors.pink),
    Category(12, "Land_Revenue", FontAwesomeIcons.landmark, Colors.teal),
    Category(13, "Bonus", FontAwesomeIcons.gift, Colors.redAccent),
    Category(14, "Miscellaneous", FontAwesomeIcons.cashRegister, Colors.deepOrangeAccent),

  };
  //* SECOND : INCOME LIST
  final incomeList = {
    Category(0, "Milk_Sales", FontAwesomeIcons.wallet, Colors.green),
    Category(1, "Awards", FontAwesomeIcons.moneyCheck, Colors.amber),
    Category(2, "Grants", FontAwesomeIcons.gifts, Colors.lightGreen),
    Category(3, "Livestock_Sales", FontAwesomeIcons.truckPickup, Colors.yellow),
    Category(4, "Investment", FontAwesomeIcons.piggyBank, Colors.cyanAccent),
    Category(5, "Other", FontAwesomeIcons.dice, Colors.deepOrange),
  };
}
