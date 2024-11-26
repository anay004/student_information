import 'package:flutter/material.dart';
import "package:convex_bottom_bar/convex_bottom_bar.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:student_information/add_stu.dart';
import 'package:student_information/view_all.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              toolbarHeight: 300,
              backgroundColor: Colors.black,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hello! IIUCian",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Welcome To Student Desk",
                        style: GoogleFonts.aboreto(
                          textStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 220, 30, 0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: SizedBox(
                            height: 250, // Adjust the height as needed
                            child: Image.asset(
                              "assets/images/addstu.png",
                              fit: BoxFit.contain, // Ensures proper scaling
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddStu()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Button background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // Rounded corners
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          child:  Text(
                            "Add Student",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Text color
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: SizedBox(
                            height: 250, // Adjust the height as needed
                            child: Image.asset(
                              "assets/images/viewall.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ViewAll()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Button background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // Rounded corners
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          child:  Text(
                            "View All Student",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Text color
                              ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "Coming Soon...",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Text color
                          ),),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "Coming Soon...",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Text color
                          ),),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.teal,
        items: const [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.person, title: "profile"),
          TabItem(icon: Icons.settings, title: "Settings"),
        ],
        // onTap: (int index) {
        //   if (index == 1) {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => AddStu()),
        //     );
        //   } else if (index == 2) {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => ViewAll()),
        //     );
        //   }
        // },
      ),
    );
  }
}
