import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_final/core/provider.dart';
import 'package:to_do_final/core/theme.dart';

import '../home/home_view.dart';
import '../setting/setting_View.dart';
import 'bottom_sheet_widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "HomePage";

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ScreenIndex = 0;
  List<Widget> pages = [HomeScreen(), setting()];

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);

    return Scaffold(
       backgroundColor: appProvider.isDark() ?  Colors.black : const Color(0xFFDFECDB),
      body: pages[ScreenIndex],

      floatingActionButton: CircleAvatar(
       
        child: FloatingActionButton(
          onPressed: (){
            showAddTaskBottomSheet();
          },
      
          child: const Icon(Icons.add ,size: 20,),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,

      bottomNavigationBar: BottomAppBar(

        shape: const CircularNotchedRectangle(),
        notchMargin: 12,

        child: BottomNavigationBar(
          currentIndex: ScreenIndex,
          onTap: (value){
            ScreenIndex=value;
            setState(() {
            });
          },
          items: const [

            BottomNavigationBarItem (
                icon: ImageIcon(AssetImage("assets/Icon awesome-list.png")),label: "Setting"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/Icon feather-settings.png")),label: "Home"),

          ],
        ),
      ),
    );
  }



  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        builder: (context) => BottomSheetView());
  }
}
