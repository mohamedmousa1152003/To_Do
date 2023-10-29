import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_final/pages/home/widget/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 157,
              width: double.infinity,
              color: theme.primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 45, left: 30),
                child: Text(
                  "To  Do  List ",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 83),
              child: CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365),
                ),
                onDateSelected: (date) => print(date),
                leftMargin: 20,
                monthColor: Colors.black,
                dayColor: Colors.black,
                activeDayColor: theme.primaryColor,
                activeBackgroundDayColor: Colors.white,
                dotsColor: theme.primaryColor,
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              ),
            ),
          ]),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Task(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
