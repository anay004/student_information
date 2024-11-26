import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_information/model/notes.dart';
import 'database/db_helper.dart';
import 'home_page.dart';
class UpdateStu extends StatefulWidget {

  final notes;
  const UpdateStu ({super.key,required this.notes});

  @override
  State<UpdateStu > createState() => _UpdateStuState();
}

class _UpdateStuState extends State<UpdateStu> {

  late DatabaseHelper dbHelper;

  var idController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var departmentController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();

  final GlobalKey<FormState> noteFormKey = GlobalKey();

  String? id;

  //add notes to database
  Future  updateNotes(String id) async
  {
    final updatedNote = Note(
      id: idController.text,
      name: nameController.text,
      phone: phoneController.text,
      department: departmentController.text,
      email: emailController.text,
      address: addressController.text,
    );

    int check= await dbHelper.updateData(updatedNote.toMap(),id as String);
    print("Check=$check");
    if(check>0)
    {

      Get.snackbar("", "",
          titleText: Text("Updated, Info Updated", style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),),
          snackPosition: SnackPosition.BOTTOM);
      Get.offAll(HomePage());

    }
    else
    {
      Get.snackbar("", "",
          titleText: Text("Error in Info update", style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),),
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DatabaseHelper.instance;
    idController.text=widget.notes.id;
    nameController.text=widget.notes.name;
    phoneController.text=widget.notes.phone;
    departmentController.text=widget.notes.department;
    emailController.text=widget.notes.email;
    addressController.text=widget.notes.address;
    id=widget.notes.id;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.teal,
        title: Text("Updates Notes",style: TextStyle(
            color: Colors.white
        ),),


      ),
      body: Form(
        key: noteFormKey,
        child:SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ID Input Field
              Text("ID:",
                style: GoogleFonts.lato(
                  textStyle:TextStyle(fontSize: 16, color: Colors.white),),
              ),
              SizedBox(height: 5),
              TextFormField(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                controller: idController,
                decoration: InputDecoration(
                  fillColor: Colors.teal[900],
                  filled: true,
                  hintText: "Enter ID ",
                  //labelText: "Enter ID",
                  labelStyle: GoogleFonts.lato(
                    color: Colors.white,),
                  //prefixIcon: const Icon(Icons.title, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blueGrey, // Border color for enabled state
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color when focused
                      width: 3,         // Thickness when focused
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter ID";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Name Input Field
              Text(
                "Name:",
                style: GoogleFonts.lato(
                  textStyle:TextStyle(fontSize: 16, color: Colors.white),),
              ),
              SizedBox(height: 5),
              TextFormField(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                controller: nameController,
                //maxLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal[900],
                  hintText: "Enter Name",
                  //labelText: "Enter Name",
                  labelStyle: GoogleFonts.lato(
                    color: Colors.white,),
                  //prefixIcon: const Icon(Icons.description, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blueGrey, // Border color for enabled state
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color when focused
                      width: 3,         // Thickness when focused
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Phone Input Field
              Text(
                "Phone Number:",
                style: GoogleFonts.lato(
                  textStyle:TextStyle(fontSize: 16, color: Colors.white),),
              ),
              SizedBox(height: 5),
              TextFormField(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal[900],
                  hintText: "Enter Phone number",
                  //labelText: "Enter Phone number",
                  labelStyle: GoogleFonts.lato(
                    color: Colors.white,),
                  //prefixIcon: const Icon(Icons.phone, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blueGrey, // Border color for enabled state
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color when focused
                      width: 3,         // Thickness when focused
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter phone number";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              //Department Input Field
              Text(
                "Department:",
                style: GoogleFonts.lato(
                  textStyle:TextStyle(fontSize: 16, color: Colors.white),),
              ),
              SizedBox(height: 5),
              TextFormField(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                controller: departmentController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal[900],
                  hintText: "Enter Department",
                  //labelText: "Enter Department",
                  labelStyle: GoogleFonts.lato(
                    color: Colors.white,),
                  //prefixIcon: const Icon(Icons.local_fire_, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blueGrey, // Border color for enabled state
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color when focused
                      width: 3,         // Thickness when focused
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Department";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Email Input Field
              Text(
                "Email:",
                style: GoogleFonts.lato(
                  textStyle:TextStyle(fontSize: 16, color: Colors.white),),
              ),
              SizedBox(height: 5),
              TextFormField(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal[900],
                  hintText: "Enter email address",
                  //labelText: "Enter email address",
                  labelStyle: GoogleFonts.lato(
                    color: Colors.white,),
                  //prefixIcon: const Icon(Icons.email, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blueGrey, // Border color for enabled state
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color when focused
                      width: 3,         // Thickness when focused
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Address Input Field
              Text(
                "Address:",
                style: GoogleFonts.lato(
                  textStyle:TextStyle(fontSize: 16, color: Colors.white),),
              ),
              SizedBox(height: 5),
              TextFormField(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                controller: addressController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal[900],
                  hintText: "Enter Address",
                  //labelText: "Enter Address",
                  labelStyle: GoogleFonts.lato(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blueGrey, // Border color for enabled state
                      width: 3,         // Thickness of the border
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color when focused
                      width: 3,         // Thickness when focused
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(

                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onPressed: () async {
                  if(noteFormKey.currentState!.validate())
                  {
                    noteFormKey.currentState!.save();
                    updateNotes(id!);
                  }

                },
                child:  Text(
                  "Update Notes",
                  style: const TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}