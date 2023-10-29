import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_final/core/provider.dart';

class selectOption extends StatelessWidget {
  final String selectedTitle;

  const selectOption({super.key, required this.selectedTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
      var appProvider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:  appProvider.isDark() ?  Colors.black : const Color(0xFFDFECDB),
            width: 2,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(selectedTitle),
          Icon(
            Icons.check,
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
