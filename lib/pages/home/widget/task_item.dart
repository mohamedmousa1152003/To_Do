import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_final/core/network_layer/firestore_utils.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_final/core/provider.dart';
import 'package:to_do_final/core/theme.dart';

import '../../../model/task_model.dart';

class Task extends StatelessWidget {
  final TaskModel taskModel ;
   Task ({super.key ,required this.taskModel});


  @override
  Widget build(BuildContext context) {
      var appProvider = Provider.of<AppProvider>(context);
      var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          color: const Color(0xFFEC4B4B),
          borderRadius: BorderRadius.circular(15)),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 2,
              onPressed: (context) async{
                await  FirestoreUtils.deleteDataToFireStore(taskModel);
              },
              borderRadius: BorderRadius.circular(13),
              backgroundColor: const Color(0xFFEC4B4B),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: locale.delete,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color:  appProvider.isDark() ? Color(0xFF141922):Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 6,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    taskModel.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                  Text(
                    taskModel.description,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.alarm ,color: appProvider.isDark() ? Colors.white: Colors.black ,),
                      const SizedBox(width: 5),
                      Text(
                        "10:30 AM ",
                        style: TextStyle(color: appProvider.isDark() ? Colors.white: Colors.black )  ,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 35,
                width: 70,
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset("assets/Icon awesome-check.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
