// import 'package:dynamic_timeline_tile_flutter/dynamic_timeline_tile_flutter.dart';
import 'package:dynamic_timeline_tile_flutter/dynamic_timeline_tile_flutter.dart';
import 'package:example/Helper/Colors.dart';
import 'package:example/Widgets/CustomEventTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TestDynamicTimeLine extends StatelessWidget {
  const TestDynamicTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dynamic Timeline Tile Flutter With StarerChild",
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
              DynamicTimelineTile(

                  // break dates helps to break the date into day and month format

                  // Split complete date into two parts

                  breakDate: true, // By default it is true

                  // make breakDate: false, if you doesnt wants to break the line

                  // indicator colors

                  indicatorColor: grey
                      .shade400, // Define the color of line middle of dates and events tile

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

                  // Starer dates

                  // Starer Dates and events length should be same to build it

                  // you cannot use starerDates and starerChild at a same time... Because starerChild list is the option for customBuild inplace of starerChild

                  starerChild: [
                    CustomIconChild(icon: MdiIcons.cash),
                    CustomIconChild(icon: MdiIcons.swapVertical),
                    CustomIconChild(icon: MdiIcons.monitorAccount),
                    CustomIconChild(icon: MdiIcons.earth),
                    CustomIconChild(icon: MdiIcons.accountStar),
                  ],


                  // starerDates: const [
                  //   "2 Jan",
                  //   "9 Jan",
                  //   "22 Jan",
                  //   "2 Feb",
                  //   "7 Feb"
                  // ],
                  events: [
                    EventCard(
                      // horizontal padding for content
                      horizontalCardPadding: 12.w,

                      // vertical padding for content
                      verticalCardPadding: 12.h,

                      // width for container
                      width: MediaQuery.of(context).size.width.w,

                      //event card
                      child: const CustomEventTile(
                          title: "Future Finance Forum",
                          description:
                              "Dive into the future of finance, fintech innovations, and investment strategies for tomorrow's economy."),
                    ),
                    EventCard(
                      // horizontal padding for content
                      horizontalCardPadding: 12.w,

                      // vertical padding for content
                      verticalCardPadding: 12.h,

                      // width for container
                      width: MediaQuery.of(context).size.width.w,

                      child: const CustomEventTile(
                          title: "Adventure Seekers Expo",
                          description:
                              "Explore adrenaline-pumping activities, gear demos, and expert talks on outdoor adventures."),
                    ),
                    EventCard(
                      // horizontal padding for content
                      horizontalCardPadding: 12.w,

                      // vertical padding for content
                      verticalCardPadding: 12.h,

                      // width for container
                      width: MediaQuery.of(context).size.width.w,

                      child: const CustomEventTile(
                          title: "Innovation Ignite Conference",
                          description:
                              "Ignite creativity and entrepreneurship through keynotes, panels, and startup showcases."),
                    ),
                    EventCard(
                      // horizontal padding for content
                      horizontalCardPadding: 12.w,

                      // vertical padding for content
                      verticalCardPadding: 12.h,

                      // width for container
                      width: MediaQuery.of(context).size.width.w,

                      child: const CustomEventTile(
                          title: "Science Spectacular Showcase",
                          description:
                              "Engage in hands-on experiments, mind-blowing demos, and science-themed entertainment."),
                    ),
                    EventCard(
                      // horizontal padding for content
                      horizontalCardPadding: 12.w,

                      // vertical padding for content
                      verticalCardPadding: 12.h,

                      // width for container
                      width: MediaQuery.of(context).size.width.w,

                      child: const CustomEventTile(
                          title: "Leadership Summit Series",
                          description:
                              "Empower leadership skills with renowned speakers, workshops, and networking opportunities."),
                    ),
                  ]),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class CustomIconChild extends StatelessWidget {
  final IconData icon;
  const CustomIconChild({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(color: grey.shade200, shape: BoxShape.circle),
      child: Icon(icon, size: 19.sp,),
    );
  }
}
