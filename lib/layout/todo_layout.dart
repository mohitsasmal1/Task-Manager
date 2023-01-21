import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:todo_tasks_with_alert/layout/todo_layoutcontroller.dart';
import 'package:todo_tasks_with_alert/model/event.dart';
import 'package:todo_tasks_with_alert/modules/add_event_screen/add_event_screen.dart';
import 'package:todo_tasks_with_alert/modules/clear_data/clear_data.dart';
import 'package:todo_tasks_with_alert/modules/search_events/search_events.dart';
import 'package:todo_tasks_with_alert/shared/componets/componets.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:todo_tasks_with_alert/shared/network/local/notification.dart';
import 'package:todo_tasks_with_alert/shared/styles/styles.dart';
import 'package:todo_tasks_with_alert/shared/styles/thems.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoLayout extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoLayoutController>(
      init: Get.find<TodoLayoutController>(),
      builder: (todocontroller) => Scaffold(
        drawer: _drawer(context),
        key: _scaffoldkey,
        // NOTE App Bar
        appBar: _appbar(todocontroller, context),

        //NOTE Body
        body: Obx(
          () => todocontroller.isloading.value
              ? Center(child: CircularProgressIndicator())
              : Container(
                
                  margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat.yMMMMd().format(DateTime.parse(
                                    todocontroller.currentSelectedDate)),
                                style: subHeaderStyle,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                todocontroller.currentSelectedDate !=
                                        DateTime.now()
                                            .toString()
                                            .split(' ')
                                            .first
                                    ? DateFormat.E().format(DateTime.parse(
                                        todocontroller.currentSelectedDate))
                                    : "Today",
                                style: headerStyle,
                              ),
                            ],
                          ),
                          defaultButton(
                              text: "Add Event",
                              width: 100,
                              onpress: () {
                                Get.to(() => AddEventScreen());
                              },
                              gradient: orangeGradient,
                              radius: 15),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //NOTE timeline datepicker -------------
                      Container(
                        child: DatePicker(
                          DateTime.now(),
                          height: 90,
                          width: 70,
                          initialSelectedDate: DateTime.now(),
                          selectionColor: defaultLightColor,
                          selectedTextColor: Colors.white,
                          dayTextStyle: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                          dateTextStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          monthTextStyle: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                          onDateChange: (value) {
                            var selecteddate = value.toString().split(' ');
                            print(selecteddate[0]);
                            todocontroller.onchangeselectedate(selecteddate[0]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // NOTE list Of Tasks
                      Expanded(
                          child: todocontroller
                              .screens[todocontroller.currentIndex]),
                    ],
                  ),
                ),
        ),

        //NOTE bottom navigation
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          
          currentIndex: todocontroller.currentIndex,
          onTap: (index) {
            todocontroller.onchangeIndex(index);
          },
          items: todocontroller.bottomItems,
        ),
      ),
    );
  }

  _appbar(TodoLayoutController todocontroller, BuildContext context) => AppBar(
        title: Text(
          todocontroller.appbar_title[todocontroller.currentIndex],
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          IconButton(
            onPressed: () {
              //TODO: search screen
              Get.to(() => SearchEvents());
              //NotificationApi.shownotification();
            },
            icon: Icon(
              Get.isDarkMode ? Icons.search : Icons.search,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              todocontroller.onchangeThem();
            },
            icon: Icon(
              Get.isDarkMode ? Icons.wb_sunny : Icons.mode_night,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      );

  _drawer(BuildContext context) => Drawer(
        
        
        shape: const RoundedRectangleBorder(
              
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(70),
                  
                  ),
                ),
    
        child: Column(
          
          children: [
            Container(
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                image: DecorationImage(image: AssetImage('assets/24146.jpg')
                ,
                
                fit: BoxFit.cover,
                
                 ),
		          
               
              
              ),
              padding: EdgeInsets.only(left: 15, right: 15, top: 50),
              height: 250,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      
                      children: [
                        SizedBox(
                          height: 120,
                        ),
                        CircleAvatar(
                            
                            radius: 50,
                            backgroundImage:
                              AssetImage('assets/profilepic.jpg')
                              ),
                        SizedBox(
                          width: 10,
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.cloud_sync_rounded),
                          color: Colors.grey.shade200,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    
                  ),
                  Text(
                    "Mohit Sasmal",
                    style: GoogleFonts.montserrat(
                        letterSpacing: 2, 
                        fontWeight: FontWeight.normal, 
                        fontSize: 20,
                        color: Colors.white,
                        
                        ),
                  ),
                  Text(
                    "msasmal137@gmail.com",
                    style: GoogleFonts.poppins(
                        letterSpacing: 2, 
                        fontWeight: FontWeight.normal, 
                        color: Colors.white,
                        fontSize: 15,
                        ),
                  ),
                  
                  
                ],
              ),
            ),
            SizedBox(
                    height: 20,
                    
                  ),
            ListTile(
              onTap: () {
                Get.to(ClearData());
              },
              leading: Icon(Icons.delete),
              title: Text(
                "Clear Data",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.search),
              title: Text(
                "Search",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
          ],
        ),
      );
}
