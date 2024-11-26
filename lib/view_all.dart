import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:student_information/home_page.dart';
import 'package:student_information/update_stu.dart';

import 'package:student_information/model/notes.dart';
import 'database/db_helper.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  late DatabaseHelper dbHelper;
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;
    loadAllData();
  }

  Future loadAllData() async {
    var data = await dbHelper.getAllData();
    setState(() {
      notes = data.map((element) => Note.fromMap(element)).toList();
    });
  }

  Future deleteData(String id) async {
    int result = await dbHelper.deleteData(id as String);
    if (result != 0) {
      Fluttertoast.showToast(msg: "Student Information deleted successfully");
      loadAllData();
    } else {
      Fluttertoast.showToast(msg: "Failed to delete Student Information");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Student List",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.offAll(HomePage());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: notes.isEmpty
                ? Center(
              child: Text(
                "No Student List Available",
                style: TextStyle(color: Colors.white),
              ),
            )
                : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                // Note initialize
                Note student = notes[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0), // Gap between items
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[900], // Background color of the list item
                      borderRadius: BorderRadius.circular(5), // Rounded corners
                      border: Border.all(
                        color: Colors.white, // Border color
                        width: 2, // Border width
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateStu(notes: student)),
                        );
                        // Go to update page
                      },
                      title: Text(
                        student.name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(student.id!,
                          style: TextStyle(color: Colors.white70)),
                      leading: Icon(
                        Icons.account_circle_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.question,
                            headerAnimationLoop: false,
                            animType: AnimType.bottomSlide,
                            dialogBackgroundColor: Colors.black,
                            borderSide: BorderSide(
                              color: Colors.grey, // Border color
                              width: 3,
                            ),
                            title: 'Delete',
                            titleTextStyle: TextStyle(
                              color: Colors.teal, // Title color
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            desc: 'Want To Delete this Student Information',
                            descTextStyle: TextStyle(
                              color: Colors.white70, // Description color
                              fontSize: 16,
                            ),
                            btnOk: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                side: BorderSide(
                                    color: Colors.white,
                                    width: 2), // White border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                deleteData(student.id!);
                                Get.back();
                              },
                              child: Text(
                                'YES',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            btnCancel: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                side: BorderSide(
                                    color: Colors.white,
                                    width: 2), // White border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'NO',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ).show();
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 40,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
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
