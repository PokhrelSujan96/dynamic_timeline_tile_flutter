// ignore_for_file: prefer_const_constructors

import 'package:dynamic_timeline_tile_flutter/dynamic_timeline_tile_flutter.dart';
import 'package:example/Helper/Colors.dart';
import 'package:example/Widgets/CustomEventTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TestMultiDynamicTimeLineTile extends StatelessWidget {
  const TestMultiDynamicTimeLineTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Multi Timeline Tile List",
          style: GoogleFonts.mulish(
            fontWeight: FontWeight.bold,
            color: black,
            fontSize: 14.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                MultiDynamicTimelineTileBuilder(
                  itemCount: myEvents.keys.toList().length,
                  itemBuilder: (context, index) {
                    final date = myEvents.keys.toList()[index];
                    final eventsList = myEvents[date] ?? [];

                    return MultiDynamicTimelineTile(

                      // indicatorWidth: 2.w,
                      // break dates helps to break the date into day and month format

                      // Split complete date into two parts

                      breakDate: true, // By default it is true

                      // make breakDate: false, if you doesnt wants to break the line

                      // indicator colors

                      indicatorColor: purple
                          .withOpacity(0.3), // Define the color of line middle of dates and events tile

                      // cross spacing
                      crossSpacing: 12
                          .w, // Cross spacing create the space between the dates, indicator and content tile

                      // Main spacing
                      mainSpacing: 16
                          .h, // Main spacing create the vertical spacing between two content and dates tile

                      // Textstyle for starer dates

                      dateStyle: GoogleFonts.mulish(
                          color: black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.4,
                          fontSize: 22.sp),
                      starerDates: [date],
                      eventsList: [
                        eventsList.map((e) {
                          return EventCard(
                            cardColor: purple.withOpacity(0.05),
                            child: CustomEventTile2(
                              icon: MdiIcons.bookOutline,
                              title: e.subject,
                              description: e.description,
                            ),
                          );
                        }).toList()
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Event {
  final String subject;
  // final String day;
  final String description;

  Event({required this.subject, required this.description});
}

final Map<String, List<Event>> myEvents = {
  '2 Jan': [
    Event(
        subject: 'Mathematics',
        description: "Exam will start from 11:30 and ends in 3:15"),
    Event(
        subject: 'General Science',
        description:
            "Exam will start from 11:30 and ends in 3:15. Students are informed to bring their project work along with the materials needed."),
  ],
  '14 Jan': [
    Event(
        subject: 'Physics',
        description:
            "Exam will start from 9:00 and ends in 12:00. Please bring a scientific calculator."),
    Event(
        subject: 'Foreign Language',
        description:
            "Exam will start from 8:00 and ends in 11:00. Bilingual dictionaries permitted."),
    Event(
        subject: 'Literature',
        description:
            "Exam will start from 11:00 and ends in 2:00. Bring novels for reference."),
  ],
  '15 Jan': [
    Event(
        subject: 'Chemistry',
        description:
            "Exam will start from 10:00 and ends in 1:00. Lab coats are mandatory."),
  ],
  '16 Jan': [
    Event(
        subject: 'Biology',
        description:
            "Exam will start from 8:30 and ends in 11:30. Dissection kit required."),
    Event(
        subject: 'Computer Science',
        description:
            "Exam will start from 10:30 and ends in 1:30. Coding devices allowed."),
    Event(
        subject: 'History',
        description:
            "Exam will start from 12:00 and ends in 3:00. Study materials must include historical maps."),
  ],
  '18 Jan': [
    Event(
        subject: 'Geography',
        description:
            "Exam will start from 9:30 and ends in 12:30. Bring a compass and protractor."),
  ],
};
