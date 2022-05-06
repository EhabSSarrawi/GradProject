import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:sara_music/Shop/colors.dart';
import 'package:time_range/time_range.dart';

import 'Constant.dart';

class TBreak extends StatefulWidget {
  const TBreak({Key? key}) : super(key: key);

  @override
  _TBreakState createState() => _TBreakState();
}

class _TBreakState extends State<TBreak> {
  static const double leftPadding = 50;

  DatePickerController _controller = DatePickerController();
  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 9, minute: 00),
    TimeOfDay(hour: 10, minute: 00),
  );
  TimeRangeResult? _timeRange;
  DateTime _selectedValue = DateTime.now();
  @override
  void initState() {
    super.initState();
    _timeRange = _defaultTimeRange;
  }

  String radioButtonItem = 'New';

  // Group Value for Radio Button.
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 18, left: 10, right: 10),
                  child: InkWell(
                    child: Image.asset(
                      'images/icons-menu.png',
                      height: 30,
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                  child: Text(
                    'Break',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: leftPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Select Date to take a break',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold, color: Color(MyColors.dark)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 80,
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Color(MyColors.primary),
                  selectedTextColor: Colors.white,
                  inactiveDates: [],
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: leftPadding,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Select Time',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold, color: Color(MyColors.dark)),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TimeRange(
                fromTitle: Text(
                  'FROM',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(MyColors.dark),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                toTitle: Text(
                  'TO',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(MyColors.dark),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Color(MyColors.dark),
                ),
                activeTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                borderColor: Color(MyColors.grey02),
                activeBorderColor: Color(MyColors.grey02),
                backgroundColor: Colors.transparent,
                activeBackgroundColor: Color(MyColors.primary),
                firstTime: TimeOfDay(hour: 9, minute: 00),
                lastTime: TimeOfDay(hour: 18, minute: 00),
                initialRange: _timeRange,
                timeStep: 60,
                timeBlock: 60,
                onRangeCompleted: (range) => setState(() => _timeRange = range),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: id,             
                  fillColor: MaterialStateColor.resolveWith((states) => Color(MyColors.primary)),
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'New';
                      id = 1;
                    });
                  },
                ),
                Text(
                  'New',
                  style: new TextStyle(fontSize: 17.0),
                ),
                Radio(
                  value: 2,
                  groupValue: id,
                  fillColor: MaterialStateColor.resolveWith((states) => Color(MyColors.primary)),
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'Update';
                      id = 2;
                    });
                  },
                ),
                Text(
                  'Update',
                  style: new TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              SizedBox(width: 20,),
            Center(
                child: ElevatedButton(
              onPressed: () {},
              child: Text("Break"),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 46, 23, 172),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  textStyle: TextStyle(fontSize: 16)),
            )),
            ],
            ),
          ],
        ),
      ),
    );
  }
}
