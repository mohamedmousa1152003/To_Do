import 'package:flutter/material.dart';

import '../../core/widget/text_form_field.dart';

class BottomSheetView extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController describeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  BottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Add  new Task",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
            ),
            CusrtomTextFormField(
              title: "Enter your task title ",
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
              title: "Enter your task describe ",
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
                  "Add  new Task",
                  style:
                      theme.textTheme.titleLarge!.copyWith(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    showCalender(context);
                  },
                  child: Text(
                    "25 oct 2023",
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print(titleController.text);
                  }
                  print(describeController.text);
                },
                child: Text(
                  "Add Task",
                  style: theme.textTheme.titleLarge,
                )),
          ],
        ),
      ),
    );
  }
}

void showCalender(context) {
  showDatePicker(
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 365)),
  );
}
