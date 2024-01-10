// ignore_for_file: prefer_const_constructors

import 'package:dynamic_timeline_tile_flutter/src/config.dart';
import 'package:flutter/material.dart';

class DynamicTimelineTile extends StatelessWidget {
  // for Dates
  final List<String>? starerDates;

  // for events
  final List<EventCard> events;

  // for indicator color
  final Color? indicatorColor;

  // boolean variable for breaking the da1te
  final bool? breakDate;

  // cross axis spacing
  final double? crossSpacing;

  // main axis spacing
  final double? mainSpacing;

  // Textstyle for leadDateShow
  final TextStyle? dateStyle;

  // Starer child
  final List<Widget>? starerChild;

  // width for indicator
  final double? indicatorWidth;

  // radius for indicator top circle
  final double? indicatorRadius;

  const DynamicTimelineTile({
    Key? key,
    this.starerDates,
    required this.events,
    this.indicatorColor,
    this.breakDate = true,
    this.crossSpacing,
    this.mainSpacing,
    this.dateStyle,
    this.starerChild, this.indicatorWidth, this.indicatorRadius,
  })  : assert(
            // making a condition where events length and either the starerchild or starerdates list length should be equal to display the timeline
            (starerChild == null && starerDates != null) ||
                (starerChild != null && starerDates == null),
            "Either starerChild or starerDates should be provided, not both."),
        assert(
            starerChild == null || events.length == starerChild.length,
            // making a condition where events length and either the starerchild or starerdates list length should be equal to display the timeline

            "Length of events should match length of starerChild."),
        assert(
            starerDates == null || events.length == starerDates.length,
            // making a condition where events length and either the starerchild or starerdates list length should be equal to display the timeline

            "Length of events should match length of starerDates."),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemCount = starerChild?.length ?? starerDates?.length ?? events.length;

    // if (starerChild?.length != events.length || starerChild?.length != events.length) {
    //   // Dates and events should be equal
    //   throw Exception("Dates and Events length must be the same");
    // }

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        // defining date, day and month
        String? date;
        String day = '';
        String month = '';

        // making a condition where if the starer dates is not null the make a split of date given by user

        if (starerDates != null && starerDates!.isNotEmpty) {
          date = starerDates![index];
          List<String> parts = date.split(' ');

          // spliting a dates into two parts

          if (parts.length >= 2) {
            // declaring dates first part as a day

            day = parts[0];

            // declaring dates second / last part as a month

            month = parts[1];
          }
        }

        Widget? childWidget;

        // building a starer child if the starer child list is not empty

        if (starerChild != null && starerChild!.isNotEmpty) {
          // if not so then terminate the process and show dates... checing either it is null or not

          childWidget = starerChild![index];
        }

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // checking whether the childWidget (starerChild) is null [Empty] or not

              if (childWidget != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [childWidget],
                )

              // if [starerChild] is null then show the date

              else if (breakDate == true)

                // breakDate help breaking the dates by spliting them into two parts and make it looks more professional

                Padding(
                  padding: EdgeInsets.only(
                    bottom: mainSpacing ?? 20,
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // first part of dates goes here

                      //
                      //
                      // Checking whether the day contain two letters or not --> if not then check the length and make the day of two integer

                      Text(
                        (day.length == 1) ? "0$day" : day,

                        // if day contain only one int then lets put 0 just front of it

                        style: dateStyle ??
                            TextStyle(
                              height: 0,
                              fontSize: 30,
                              letterSpacing: -2,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        month,
                        style: TextStyle(
                          height: 0,
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              else

                // else if the date is not breaked then show the date serially

                Text(
                  // date ?? '', // if date is null then show the ui as empty

                  // (date!.length == 1) ? '0$date' : date,

                  // here i have made a condition that if the complete date that user insert in starerDate is like 2 Jan then 0 will be added in front of it and make the single integer into double otherwise it will be same if it contains two int

                  (day.length == 1) ? '0$day $month' : '$day $month',

                  style: dateStyle ??

                      // displaying a default textstyle if user TextStyle is null

                      TextStyle(
                        height: 0,
                        fontSize: 30,
                        letterSpacing: -2,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              SizedBox(
                width: crossSpacing ?? 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  CircleAvatar(
                    backgroundColor: indicatorColor ?? colorConfig.defaultIndicatorColor,
                    radius: indicatorRadius ?? 6,
                  ),
                  Expanded(
                    child: Container(
                      width: indicatorWidth ?? 2,
                      color: indicatorColor ?? colorConfig.defaultIndicatorColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: crossSpacing ?? 16,
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: mainSpacing ?? 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [events[index]],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// dynamic timeline tile for multi events or tile

class MultiDynamicTimelineTile extends StatelessWidget {
  // for Dates
  final List<String>? starerDates;

  // for events
  final List<List<EventCard>> eventsList;

  // for indicator color
  final Color? indicatorColor;

  // boolean variable for breaking the da1te
  final bool? breakDate;

  // cross axis spacing
  final double? crossSpacing;

  // main axis spacing
  final double? mainSpacing;

  // Textstyle for leadDateShow
  final TextStyle? dateStyle;

  // Starer child
  final List<Widget>? starerChild;

    // width for indicator
  final double? indicatorWidth;

    // radius for indicator top circle
  final double? indicatorRadius;

  const MultiDynamicTimelineTile({
    Key? key,
    this.starerDates,
    required this.eventsList,
    this.indicatorColor,
    this.breakDate = true,
    this.crossSpacing,
    this.mainSpacing,
    this.dateStyle,
    this.starerChild, this.indicatorWidth, this.indicatorRadius,
  })  : assert(
            // making a condition where events length and either the starerchild or starerdates list length should be equal to display the timeline
            (starerChild == null && starerDates != null) ||
                (starerChild != null && starerDates == null),
            "Either starerChild or starerDates should be provided, not both."),
        assert(
            starerChild == null || eventsList.length == starerChild.length,
            // making a condition where events length and either the starerchild or starerdates list length should be equal to display the timeline

            "Length of events should match length of starerChild."),
        assert(
            starerDates == null || eventsList.length == starerDates.length,
            // making a condition where events length and either the starerchild or starerdates list length should be equal to display the timeline

            "Length of events should match length of starerDates."),

            // assert(
            //   (eventsList == null ) , "FIelds cannot be null"
            // ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemCount =
        starerChild?.length ?? starerDates?.length ?? eventsList.length;

    // if (starerChild?.length != events.length || starerChild?.length != events.length) {
    //   // Dates and events should be equal
    //   throw Exception("Dates and Events length must be the same");
    // }

    if (eventsList.isEmpty) {
      throw Exception("Events list cannot be null");
    }

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        // defining date, day and month
        String? date;
        String day = '';
        String month = '';

        // making a condition where if the starer dates is not null the make a split of date given by user

        if (starerDates != null && starerDates!.isNotEmpty) {
          date = starerDates![index];
          List<String> parts = date.split(' ');

          // spliting a dates into two parts

          if (parts.length >= 2) {
            // declaring dates first part as a day

            day = parts[0];

            // declaring dates second / last part as a month

            month = parts[1];
          }
        }

        Widget? childWidget;

        // building a starer child if the starer child list is not empty

        if (starerChild != null && starerChild!.isNotEmpty) {
          // if not so then terminate the process and show dates... checing either it is null or not

          childWidget = starerChild![index];
        }

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // checking whether the childWidget (starerChild) is null [Empty] or not

              if (childWidget != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [childWidget],
                )

              // if [starerChild] is null then show the date

              else if (breakDate == true)

                // breakDate help breaking the dates by spliting them into two parts and make it looks more professional

                Padding(
                  padding: EdgeInsets.only(
                    bottom: mainSpacing ?? 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // first part of dates goes here

                      Text(
                        // day,

                        (day.length == 1) ? "0$day" : day,

                        style: dateStyle ??
                            TextStyle(
                              height: 0,
                              fontSize: 30,
                              letterSpacing: -2,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        month,
                        style: TextStyle(
                          height: 0,
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              else

                // else if the date is not breaked then show the date serially

                Text(
                  // date ?? '', // if date is null then show the ui as empty

                  (day.length == 1) ? '0$day $month' : '$day $month',


                  style: dateStyle ??

                      // displaying a default textstyle if user TextStyle is null

                      TextStyle(
                        height: 0,
                        fontSize: 30,
                        letterSpacing: -2,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              SizedBox(
                width: crossSpacing ?? 16,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  CircleAvatar(
                    // if indicator color is null then use default indicator color

                    backgroundColor:
                        indicatorColor ?? colorConfig.defaultIndicatorColor,
                    radius: indicatorRadius ?? 6,
                  ),
                  Expanded(
                    child: Container(
                      width: indicatorWidth ?? 2,

                      // if indicator color is null then use default indicator color

                      color:
                          indicatorColor ?? colorConfig.defaultIndicatorColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: crossSpacing ?? 16,
              ),
              Expanded(
                child: Column(
                  children: [
                    // if mainSpacing is null then the default value will be 16
                    SizedBox(
                      height: mainSpacing ?? 16,
                    ),
                    // if custom tile is null then create a custom widget
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // displaying the event listed inside the list of events

                        for (EventCard event in eventsList[index])
                          Padding(
                              padding:
                                  EdgeInsets.only(bottom: mainSpacing ?? 16),
                              child: event),
                      ],
                    ),
                    // SizedBox(height: 20,)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// event card must be used inside the events list to make it workable

// Creating a tile card view

class EventCard extends StatelessWidget {
  // width for card
  final double? width;

  // background color for card
  final Color? cardColor;

  // content padding for card
  final double? verticalCardPadding;

// content padding for card
  final double? horizontalCardPadding;

  // radius for card
  final BorderRadius? cardRadius;

  // decoration for card
  final BoxDecoration? cardDecoration;

  // declaring child for the container
  final Widget? child;

  const EventCard({
    super.key,
    this.width,
    this.cardColor,
    this.verticalCardPadding, // default vertical padding is 12
    this.cardRadius, // default cardRadius is 10
    this.horizontalCardPadding, // default horizontalCardPadding is 12
    this.cardDecoration,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    // throw an exception if the cardColor and card decoration both are used at a sametime

    if (cardColor != null && cardDecoration != null) {
      throw Exception(
          "cardColor and Carddecoration cannot be used at same time");
    }
    return Container(
      // if the width of Event card is null then lets suppose it to be full screen size

      width: width ?? MediaQuery.of(context).size.width,

      padding: EdgeInsets.symmetric(
        // checking either the card padding is null or not

        vertical: verticalCardPadding ?? 12,

        //  if the padding is null then the default value is 12

        horizontal: horizontalCardPadding ?? 12,
      ),

      // decoration for card

      decoration: cardDecoration ??

          // Note : Color can be only provided inside box decoration or either without using decoration

          BoxDecoration(
            // card background color

            color: cardColor ?? Colors.grey.shade100,

            // card radius
            borderRadius: cardRadius ?? // cardRadius defined at top

                // default radius for content card

                const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
          ),

      // child allow user to create their content

      child: child,
    );
  }
}
