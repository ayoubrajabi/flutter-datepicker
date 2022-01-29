import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DatePicker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Jalali j = Jalali.fromDateTime(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text("DatePicker Demo"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinearDatePicker(
                startDate: "1370/01/01",
                endDate: "${j.year}/${j.month}/${j.day}",
                initialDate: "${j.year}/${j.month}/${j.day}",
                dateChangeListener: (String selectedDate) {
                  print(selectedDate);
                },
                showDay: true,
                labelStyle: TextStyle(
                  fontFamily: 'iran',
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                selectedRowStyle: TextStyle(
                  fontFamily: 'iran',
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                unselectedRowStyle: TextStyle(
                  fontFamily: 'iran',
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
                yearText: "سال | year",
                monthText: "ماه | month",
                dayText: "روز | day",
                showLabels: false,
                columnWidth: 100,
                showMonthName: true,
                isJalaali: true,
              ),
              // RaisedButton(
              //   child: Text(
              //     "Pick Date | انتخاب تاریخ",
              //   ),
              //   onPressed: () {
              //     showDateDialog(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void showDateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Choose Date'),
              content: LinearDatePicker(
                dateChangeListener: (String selectedDate) {
                  print(selectedDate);
                },
                showMonthName: true,
                isJalaali: false,
              ),
            ));
  }
}
