import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/habit_tile.dart';
import 'package:habit_tracker/widgets/my_fab.dart';
import 'package:habit_tracker/widgets/my_alert_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//
// data structure for todays list
  List todaysHabitList = [
    // [ habitName, hhabitCompleted ]
    ['Morning Run', false],
    ['Read Book', false],
    ['Code App', false],
  ];

// checkbex wwas tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todaysHabitList[index][1] = value;
    });
  }

// create a new habit
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    // show alert dialog for user to enter the new habit details
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newHabitNameController,
            hintText: 'Enter New Habit...',
            onSave: saveNewHabit,
            onCencel: cencelDialogBox,
          );
        });
  }

  // save new habit
  void saveNewHabit() {
    // add add habit to todays list
    setState(() {
      todaysHabitList.add([_newHabitNameController.text, false]);
    });

    // clear textfiel
    _newHabitNameController.clear();
    //pop dialog box
    Navigator.of(context).pop();
  }

  // cencel new habit
  void cencelDialogBox() {
    // clear textfiel
    _newHabitNameController.clear();
    //pop dialog box
    Navigator.of(context).pop();
  }

  // open habit settind to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          hintText: todaysHabitList[index][0],
          controller: _newHabitNameController,
          onSave: () {
            saveExitingHabit(index);
          },
          onCencel: cencelDialogBox,
        );
      },
    );
  }

// save exiting habit with a new name
  void saveExitingHabit(int indext) {
    setState(() {
      todaysHabitList[indext][0] = _newHabitNameController.text;
      Navigator.pop(context);
    });
  }

  // delete habit
  void deleteHabit(int index) {
    setState(() {
      todaysHabitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      floatingActionButton: MyFloatinActionButton(onPressed: createNewHabit),
      body: ListView.builder(
          itemCount: todaysHabitList.length,
          itemBuilder: (context, index) {
            return HabitTile(
              habitName: todaysHabitList[index][0],
              habitCompleted: todaysHabitList[index][1],
              onChanged: (value) => checkBoxTapped(value, index),
              settingTapped: (context) {
                openHabitSettings(index);
              },
              deleteTapped: (context) {
                deleteHabit(index);
              },
            );
          }),
    );
  }
}
