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
    // Blue rounded rectangle decoration similar to the button style
    final blueRoundedDecoration = BoxDecoration(
      color: const Color(0xFF5467B8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF5467B8).withValues(alpha: 0.3),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('DatePicker Demo'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Standard DatePicker without decoration
              Text(
                'Standard DatePicker',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              LinearDatePicker(
                startDate: DateTime(1960),
                endDate: DateTime.now().add(Duration(days: 365)),
                initialDate: DateTime.now(),
                dateChangeListener: (DateTime selectedDate) {
                  print(Jalali.fromDateTime(selectedDate));
                },
                showDay: true,
                labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                selectedRowStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.deepOrange,
                ),
                unselectedRowStyle: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
                yearLabel: 'year',
                monthLabel: 'month',
                dayLabel: 'day',
                showLabels: true,
                columnWidth: 100,
                showMonthName: true,
                isJalali: false,
                debounceDuration: Duration(milliseconds: 400),
                monthsNames: [
                  'January',
                  'February',
                  'March',
                  'April',
                  'May',
                  'June',
                  'July',
                  'August',
                  'September',
                  'October',
                  'November',
                  'December',
                ],
              ),
              SizedBox(height: 32),
              // DatePicker with blue rounded decoration
              Text(
                'DatePicker with Decoration',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              LinearDatePicker(
                startDate: DateTime(1960),
                endDate: DateTime.now().add(Duration(days: 365)),
                initialDate: DateTime.now(),
                dateChangeListener: (DateTime selectedDate) {
                  print('Decorated picker: $selectedDate');
                },
                showDay: true,
                labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                selectedRowStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                unselectedRowStyle: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
                yearLabel: 'Year',
                monthLabel: 'Month',
                dayLabel: 'Day',
                showLabels: true,
                columnWidth: 100,
                columnSpacing: 16, // Spacing between columns
                showMonthName: true,
                isJalali: false,
                // Apply the same decoration to all pickers
                selectedItemDecoration: blueRoundedDecoration,
                monthsNames: [
                  'January',
                  'February',
                  'March',
                  'April',
                  'May',
                  'June',
                  'July',
                  'August',
                  'September',
                  'October',
                  'November',
                  'December',
                ],
              ),
              SizedBox(height: 32),
              // DatePicker with different decorations for each column
              Text(
                'DatePicker with Different Decorations',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              LinearDatePicker(
                startDate: DateTime(1960),
                endDate: DateTime.now().add(Duration(days: 365)),
                initialDate: DateTime.now(),
                dateChangeListener: (DateTime selectedDate) {
                  print('Multi-decorated picker: $selectedDate');
                },
                showDay: true,
                labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                selectedRowStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                unselectedRowStyle: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
                yearLabel: 'Year',
                monthLabel: 'Month',
                dayLabel: 'Day',
                showLabels: true,
                columnWidth: 100,
                columnSpacing: 12, // Spacing between columns
                showMonthName: true,
                isJalali: false,
                // Different decorations for each picker
                monthDecoration: BoxDecoration(
                  color: const Color(0xFF5467B8),
                  borderRadius: BorderRadius.circular(12),
                ),
                dayDecoration: BoxDecoration(
                  color: const Color(0xFF43A047),
                  borderRadius: BorderRadius.circular(12),
                ),
                yearDecoration: BoxDecoration(
                  color: const Color(0xFFE53935),
                  borderRadius: BorderRadius.circular(12),
                ),
                monthsNames: [
                  'January',
                  'February',
                  'March',
                  'April',
                  'May',
                  'June',
                  'July',
                  'August',
                  'September',
                  'October',
                  'November',
                  'December',
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text(
                  'Pick Date',
                ),
                onPressed: () {
                  showDateDialog(context);
                },
              ),
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
          dateChangeListener: (DateTime selectedDate) {
            print(selectedDate);
          },
          showMonthName: true,
          isJalali: false,
          selectedRowStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          selectedItemDecoration: BoxDecoration(
            color: const Color(0xFF5467B8),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
