
# Flutter Persian (Jalali) and Gregorian Linear Date Picker
[![Pub](https://img.shields.io/pub/v/flutter_linear_datepicker?color=blue)](https://pub.dev/packages/flutter_linear_datepicker)

This package provides a Persian or Gregorian linear DatePicker for flutter. 

<p align="center">
 <img src="https://raw.githubusercontent.com/alikhaleghi76/flutter-datepicker/master/screenshots/screen1.jpg" width="300" title="Screenshot 1"> <img src="https://raw.githubusercontent.com/alikhaleghi76/flutter-datepicker/master/screenshots/screen2.jpg" width="300" alt="Screenshot 2"></p><br>

## Use this package as a library
#### 1. Depend on it
Add this to your package's pubspec.yaml file:
```
dependencies:
 flutter_linear_datepicker: ^3.0.1
 ```
#### 2. Install it
You can install packages from the command line:

```
$ flutter pub get
```
Alternatively, your editor might support pub get or flutter pub get. Check the docs for your editor to learn more.

#### 3. Import it
Now in your Dart code, you can use:
```
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
```
<br>

## How to use?
#### Simple usage
just simply put following widget in your flutter code:

```dart
LinearDatePicker(
  dateChangeListener: (DateTime selectedDate) {
    print(selectedDate);
  },
);
```
<br>

#### Advanced usage
You can customize widget using below parameters:
```dart
LinearDatePicker(
  startDate: DateTime(2022),
  endDate: DateTime.now().add(Duration(days: 365)),
  initialDate: DateTime.now(),
  dateChangeListener: (DateTime selectedDate) {
    print(selectedDate);
  },
  showDay: true,  //false -> only select year & month
  labelStyle: TextStyle(
    fontFamily: 'sans',
    fontSize: 14.0,
    color: Colors.black,
  ),
  selectedRowStyle: TextStyle(
    fontFamily: 'sans',
    fontSize: 18.0,
    color: Colors.deepOrange,
  ),
  unselectedRowStyle: TextStyle(
    fontFamily: 'sans',
    fontSize: 16.0,
    color: Colors.blueGrey,
  ),
  yearLabel: 'سال | year',
  monthLabel: 'ماه | month',
  dayLabel: 'روز | day',
  showLabels: true, // to show column captions, eg. year, month, etc.
  columnWidth: 100,
  columnSpacing: 16, // spacing between day, month, and year columns
  showMonthName: true,
  isJalali: false,  // false -> Gregorian
  debounceDuration: Duration(milliseconds: 300), // delay duration to emit the selected date
  monthsNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12',] // custom name for each month
)
```
<br>

#### Custom Decoration
You can add custom decoration to the selected item in day, month, and year pickers:

```dart
LinearDatePicker(
  dateChangeListener: (DateTime selectedDate) {
    print(selectedDate);
  },
  columnWidth: 100,
  columnSpacing: 16,
  selectedRowStyle: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.white, // white text for visibility on colored background
  ),
  // Apply the same decoration to all pickers
  selectedItemDecoration: BoxDecoration(
    color: Color(0xFF5467B8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Color(0xFF5467B8).withValues(alpha: 0.3),
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  ),
)
```

#### Different decorations for each column
You can set different decorations for day, month, and year pickers individually:

```dart
LinearDatePicker(
  dateChangeListener: (DateTime selectedDate) {
    print(selectedDate);
  },
  columnWidth: 100,
  columnSpacing: 12,
  selectedRowStyle: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  // Different decoration for month picker
  monthDecoration: BoxDecoration(
    color: Color(0xFF5467B8), // blue
    borderRadius: BorderRadius.circular(12),
  ),
  // Different decoration for day picker
  dayDecoration: BoxDecoration(
    color: Color(0xFF43A047), // green
    borderRadius: BorderRadius.circular(12),
  ),
  // Different decoration for year picker
  yearDecoration: BoxDecoration(
    color: Color(0xFFE53935), // red
    borderRadius: BorderRadius.circular(12),
  ),
)
```
<br>

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `dateChangeListener` | `Function(DateTime)` | required | Callback when date changes |
| `startDate` | `DateTime?` | 100 years ago | Minimum selectable date |
| `endDate` | `DateTime?` | current year | Maximum selectable date |
| `initialDate` | `DateTime?` | current date | Initially selected date |
| `showDay` | `bool` | `true` | Show day picker |
| `labelStyle` | `TextStyle?` | - | Style for column labels |
| `selectedRowStyle` | `TextStyle?` | - | Style for selected item text |
| `unselectedRowStyle` | `TextStyle?` | - | Style for unselected items text |
| `yearLabel` | `String` | `"سال"` | Label for year column |
| `monthLabel` | `String` | `"ماه"` | Label for month column |
| `dayLabel` | `String` | `"روز"` | Label for day column |
| `showLabels` | `bool` | `true` | Show column labels |
| `columnWidth` | `double` | `55.0` | Width of each picker column |
| `columnSpacing` | `double` | `0.0` | Spacing between columns |
| `isJalali` | `bool` | `false` | Use Jalali (Persian) calendar |
| `showMonthName` | `bool` | `false` | Show month names instead of numbers |
| `debounceDuration` | `Duration?` | `200ms` | Delay before emitting date change |
| `monthsNames` | `List<String>?` | - | Custom month names |
| `selectedItemDecoration` | `Decoration?` | - | Decoration for all selected items |
| `dayDecoration` | `Decoration?` | - | Decoration for day picker (overrides `selectedItemDecoration`) |
| `monthDecoration` | `Decoration?` | - | Decoration for month picker (overrides `selectedItemDecoration`) |
| `yearDecoration` | `Decoration?` | - | Decoration for year picker (overrides `selectedItemDecoration`) |

<br>

#### Used Packages
[MarcinusX/NumberPicker](https://github.com/MarcinusX/NumberPicker)
[FatulM/shamsi_date](https://github.com/FatulM/shamsi_date)
