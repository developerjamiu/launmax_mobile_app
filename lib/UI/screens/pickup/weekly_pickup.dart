import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:launmax_app/ui/widgets/app_dropdown.dart';
import 'package:launmax_app/ui/widgets/app_raised_button.dart';
import 'package:launmax_app/ui/widgets/app_text_field.dart';

class WeeklyPickupScreen extends StatefulWidget {
  @override
  _WeeklyPickupScreenState createState() => _WeeklyPickupScreenState();
}

class _WeeklyPickupScreenState extends State<WeeklyPickupScreen> {
  final formKey = GlobalKey<FormState>();

  TimeOfDay _pickedTime;
  DateTime _pickedDate;
  TextEditingController _timeController;
  TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _pickedTime = TimeOfDay.now();
    _pickedDate = DateTime.now();
    _timeController = TextEditingController();
    _dateController = TextEditingController();
  }

  Future<Null> selectTime(BuildContext context) async {
    TimeOfDay _time = await showTimePicker(
      context: context,
      initialTime: _pickedTime,
    );

    if (_time != null) {
      setState(() {
        _pickedTime = _time;
        _timeController.text = _pickedTime.format(context);
      });
    }
  }

  Future<Null> selectDate(BuildContext context) async {
    DateTime _date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: _pickedDate,
    );

    if (_date != null) {
      setState(() {
        _pickedDate = _date;
        _dateController.text = DateFormat.yMMMMEEEEd().format(_pickedDate);
      });
    }
  }

  String _currentDay = _days[0];
  static List<String> _days = [
    'None',
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        leading: Center(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.back,
                  size: 16,
                  color: Colors.black,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Back',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        middle: Text(
          'Weekly Pick up',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    selectTime(context);
                  },
                  child: AppTextField(
                    label: 'Set time',
                    controller: _timeController,
                    hintText: 'Set time',
                    enabled: false,
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                SizedBox(height: 20.0),
                AppDropdown(
                  text: 'Set day of the week',
                  items: _days,
                  value: _currentDay,
                  onChanged: (value) {
                    _currentDay = value;
                  },
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    selectDate(context);
                  },
                  child: AppTextField(
                    label: 'Set starting date',
                    controller: _dateController,
                    hintText: 'Set starting date',
                    enabled: false,
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                SizedBox(height: 20.0),
                AppRaisedButton(
                  text: 'Schedule',
                  onPressed: () {
                    formKey.currentState.validate();
                  },
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
