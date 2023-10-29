import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_final/core/network_layer/firestore_utils.dart';
import 'package:to_do_final/core/provider.dart';
import 'package:to_do_final/model/task_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/widget/text_form_field.dart';

class BottomSheetView extends StatefulWidget {

  BottomSheetView({super.key});

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  TextEditingController titleController = TextEditingController();

  TextEditingController describeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  DateTime selectedData  = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
   
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
             AppLocalizations.of(context)!.add_new_task,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
            ),
            CusrtomTextFormField(
              title: AppLocalizations.of(context)!.enter_your_task_title,
              controller: titleController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Enter text";
                } else {
                  return null;
                }
              },
            ),
            CusrtomTextFormField(
              title: AppLocalizations.of(context)!.enter_your_task_describe,
              controller: describeController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Error Enter text";
                } else {
                  return null;
                }
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.select_time,
                  style:
                      theme.textTheme.titleLarge!.copyWith(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    showCalender(context);
                  },
                  child: Text(
                    DateFormat.yMMMd().format(selectedData),

                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: theme.primaryColor),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                ),
                onPressed: () async{
                  if (formKey.currentState!.validate()) {
                    var model = TaskModel(
                        title: titleController.text,
                        description: describeController.text,
                        dateTime: DateTime.now(),
                        isDone: false);
                    await FirestoreUtils.addDataToFireStore(model);
                    Navigator.pop(context);
                    print(titleController.text);
                  }
                  print(describeController.text);
                },
                child: Text(
                  AppLocalizations.of(context)!.add_task,
                  style: theme.textTheme.titleLarge,
                )),
          ],
        ),
      ),
    );
  }

  void showCalender(context) async{
    var dateSelected = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if(dateSelected ==null) return ;
    selectedData=dateSelected ;
      setState(() {
      });
  }
}



