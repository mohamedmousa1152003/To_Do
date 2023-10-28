import 'package:flutter/material.dart';
import 'package:to_do_final/pages/home/home_view.dart';
import 'package:to_do_final/pages/setting/setting_View.dart';

import 'bottom_sheet_widget.dart';

class HomeLayout extends StatefulWidget {
  static String routeName = "HomeLayout";

  HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<Widget> screen = [
      const HomeScreen(),
      const Setting(),
    ];
    return Scaffold(
      body: screen[screenIndex],
      floatingActionButton: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {
            showAddTaskBottomSheet();
          },
          child: const Icon(
            Icons.add,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
            onTap: (value) {
              screenIndex = value;
              setState(() {});
            },
            currentIndex: screenIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/Icon awesome-list.png")),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon:
                      ImageIcon(AssetImage("assets/Icon feather-settings.png")),
                  label: "Setting"),
            ]),
      ),
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
      ),
      builder: (context) => const BottomSheetWidget(),
    );
  }
}
