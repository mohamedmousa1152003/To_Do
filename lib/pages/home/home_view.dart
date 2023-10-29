import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_final/core/network_layer/firestore_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_final/core/provider.dart';
import 'package:to_do_final/core/theme.dart';
import 'package:to_do_final/model/task_model.dart';
import 'package:to_do_final/pages/home/widget/task_item.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: ThemeApplication.isDark ?  Colors.black : const Color(0xFFDFECDB),
      backgroundColor: appProvider.isDark() ?  Colors.black : const Color(0xFFDFECDB),
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 165,
              width: double.infinity,
              color: theme.primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 45, left: 30),
                child: Text(
                   AppLocalizations.of(context)!.to_do_list,
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
                monthColor: appProvider.isDark() ?Colors.white: Colors.black,
                dayColor: appProvider.isDark() ?Colors.white: Colors.black,
                activeDayColor: appProvider.isDark() ?Colors.white :theme.primaryColor,
                activeBackgroundDayColor: appProvider.isDark() ?  const Color(0xFF060E1E) : Colors.white,
                dotsColor: theme.primaryColor,
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              ),
            ),
          ]),
          // Expanded(
          //   child: FutureBuilder<List<TaskModel>>(
          //     future: FirestoreUtils.getDataToFireStore(),
          //     builder: (context, snapshot) {
          //       if(snapshot.hasError)
          //       {
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(snapshot.error.toString()),
          //             const SizedBox(height: 20),
          //             IconButton(onPressed: (){
          //               //
          //             }, icon:const Icon(Icons.refresh_outlined) )
          //           ],
          //         );
          //       }
          //       if(snapshot.connectionState ==ConnectionState.waiting)
          //       {
          //         return Center(
          //           child: CircularProgressIndicator(
          //             color: theme.primaryColor,
          //           ),
          //         );
          //       }
          //       var tasksList = snapshot.data ?? [];
          //       return ListView.builder(
          //         padding: EdgeInsets.zero,
          //           itemCount: tasksList.length,
          //           itemBuilder:(context, index) => Task(
          //               taskModel : tasksList[index]
          //           ),
          //
          //
          //       );
          //     },
          //   ),
          // ),

          Expanded(
            child: StreamBuilder <QuerySnapshot<TaskModel>>(
              stream: FirestoreUtils.getRealTimeDataToFireStore(),
              builder: (context, snapshot) {
                if(snapshot.hasError)
                {
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.error.toString()),
                      const SizedBox(height: 20),
                      IconButton(onPressed: (){
                        //
                      }, icon:const Icon(Icons.refresh_outlined) )
                    ],
                  );
                }
                if(snapshot.connectionState ==ConnectionState.waiting)
                {
                  return Center(
                    child: CircularProgressIndicator(
                      color: theme.primaryColor,
                    ),
                  );
                }
                var tasksList = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: tasksList.length,
                  itemBuilder:(context, index) => Task(
                      taskModel : tasksList[index]
                  ),


                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
