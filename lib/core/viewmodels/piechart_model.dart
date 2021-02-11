import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/services/category_icon_service.dart';
import 'package:moneymanager/core/viewmodels/base_model.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/core/services/moordatabase_service.dart';
import '../../locator.dart';

class PieChartModel extends BaseModel {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final MoorDatabaseService _moorDatabaseService =
      locator<MoorDatabaseService>();

  final CategoryIconService _categoryIconService =
      locator<CategoryIconService>();

  List<Transaction> transactions = List<Transaction>();

  int selectedMonthIndex = 0;

  Map<String, double> dataMap = new Map<String, double>();

  String type = 'Expense';

  List<String> types = ["Income", "Expense"];

  init(bool firstTime) async {
    if (firstTime) selectedMonthIndex = DateTime.now().month - 1;

    setState(ViewState.Busy);
    notifyListeners();

    transactions = await _moorDatabaseService.getAllTransactionsForType(
        months.elementAt(selectedMonthIndex), type);

    dataMap = getDefaultDataMap(transactions);

    transactions.forEach((element) {
      prepareDataMap(element);
    });

    print(dataMap.toString());

    setState(ViewState.Idle);
    notifyListeners();
  }

  changeSelectedMonth(int val) async {
    selectedMonthIndex = val;

    transactions = await _moorDatabaseService.getAllTransactionsForType(
        months.elementAt(selectedMonthIndex), type);
    // clear old data
    dataMap = getDefaultDataMap(transactions);

    transactions.forEach((element) {
      prepareDataMap(element);
    });

    notifyListeners();
  }

  Map<String, double> getDefaultDataMap(List<Transaction> transactions) {
    Map<String, double> fullExpensesMap = {
      'Feed': 0,
      'Livestock': 0,
      'Operation': 0,
      'Wages': 0,
      'Fuel': 0,
      'Machinery': 0,
      'Pet': 0,
      'Insurance': 0,
      'Telephone': 0,
      'Advertisement': 0,
      'Labor': 0,
      'Tax': 0,
      'Land_revenue': 0,
      'Bonus': 0,
      'Miscellaneous': 0,
      'Milk_Sales': 0,
      'Awards': 0,
      'Grants': 0,
      'Livestock_Sales': 0,
      'Investment': 0,
      'Other': 0,
    };

    Map<String, double> fullIncomeMap = {
      'Milk_Sales': 0,
      'Awards': 0,
      'Grants': 0,
      'Livestock_Sales': 0,
      'Investment': 0,
      'Lottery': 0,
    };

    List<String> transactionsCategories = List();

    transactions.forEach((element) {
      if (type == 'Income') {
        String category = _categoryIconService.incomeList
            .elementAt(element.categoryindex)
            .name;
        transactionsCategories.add(category);
      } else {
        String category = _categoryIconService.expenseList
            .elementAt(element.categoryindex)
            .name;
        transactionsCategories.add(category);
      }
    });

    if (type == 'Income') {
      fullIncomeMap.removeWhere((key, value) {
        return !transactionsCategories.contains(key);
      });
      return fullIncomeMap;
    }

    fullExpensesMap.removeWhere((key, value) {
      return !transactionsCategories.contains(key);
    });

    return fullExpensesMap;
  }

  changeType(int val) async {
    // 0 => income
    // 1 => expense
    if (val == 0) {
      type = 'Income';
    } else {
      type = 'Expense';
    }

    await init(false);
  }

  void prepareDataMap(element) {
    if (type == 'Income') {
      dataMap[_categoryIconService.incomeList
          .elementAt(element.categoryindex)
          .name] = dataMap[_categoryIconService.incomeList
              .elementAt(element.categoryindex)
              .name] +
          element.amount;
    } else {
      dataMap[_categoryIconService.expenseList
          .elementAt(element.categoryindex)
          .name] = dataMap[_categoryIconService.expenseList
              .elementAt(element.categoryindex)
              .name] +
          element.amount;
    }
  }
}
