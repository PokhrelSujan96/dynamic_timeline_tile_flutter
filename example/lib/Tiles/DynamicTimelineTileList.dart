import 'package:dynamic_timeline_tile_flutter/dynamic_timeline_tile_flutter.dart';
import 'package:example/Helper/Colors.dart';
import 'package:example/Widgets/CustomEventTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TestDynamicTimeLineTileBuilder extends StatelessWidget {
  const TestDynamicTimeLineTileBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dynamic Timeline Tile List",
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
                DynamicTimelineTileBuilder(
                  // itemCount: myEvents.keys.toList().length,

                  itemBuilder: (context, index) {
                    return DynamicTimelineTile(
                      indicatorRadius: 5.sp,

                      indicatorWidth: 3.w,
                      // break dates helps to break the date into day and month format

                      // Split complete date into two parts

                      breakDate: true, // By default it is true

                      // make breakDate: false, if you doesnt wants to break the line

                      // indicator colors

                      indicatorColor: purple.withOpacity(
                          0.3), // Define the color of line middle of dates and events tile

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

                      // make the dates

                      starerChild: [
                        Icon(MdiIcons.home),
                      ],

                      // starerDates: [
                      //   eventData[index]["date"]!,
                      // ],
                      events: [
                        EventCard(
                          child: CustomEventTile(
                              title: eventData[index]["title"]!,
                              description: eventData[index]["description"]!),
                        )
                      ],
                    );
                  },
                  itemCount: eventData.length,
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

final List<Map<String, String>> eventData = [
  {
    "title": "Title",
    "description": "This is a content description for 12 jan",
    "date": "2 Jan",
  },
  {
    "title": "Title",
    "description": "This is a content description for 13 jan",
    "date": "13 Jan",
  },
  {
    "title": "Title",
    "description": "This is a content description for 14 jan",
    "date": "14 Jan",
  },
  {
    "title": "Title",
    "description": "This is a content description for 15 jan",
    "date": "15 Jan",
  },
];
