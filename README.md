
# Dynamic_Timeline_Tile_Flutter

Fully Dynamic and customized timelineTile, where you can create a multi events list within the dates and customized child widgets.



## Installation

Install Dynamic_Timeline_Flutter

```flutter
  cd my-project

  pub add dynamic_timelinetile_flutter

```
    
## Demo Video


![packagevideo](https://github.com/PokhrelSujan96/flutter-video-slider/assets/127024726/4e6402f7-2a21-4cd6-9dcd-13fe55877d4d)


## Usage / Examples

DynamicTimelineTile widget can be simply call by importing the package.

After importing the package use DynamicTimelineTile like below shown :





## DynamicTimelineTile 

```flutter

DynamicTimelineTile();

```

## MultiDynamicTimelineTile 

* The MultiDynamicTimelineTile allows you to create a multiple Events or Contents within the sameDate or starerChild

```flutter

MultiDynamicTimelineTile();

```

## DynamicTimeLineTileBuilder 

```flutter

DynamicTimeLineTileBuilder();

```



## MultiDynamicTimelineTileBuilder 

MultiDynamicTimelineTileBuilder  helps you to display the MultiDynamicTimelineTile easily from your model class or api. You dont need to get panic and write a long code to display multiple contents under same date. You can simply use the MultiDynamicTimelineTileBuilder.

```flutter

MultiDynamicTimelineTileBuilder();

```

This is how to use MultiDynamicTimelineTileBuilder in flutter :


```flutter

// Create a model class 

class Event {
  final String subject;
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
}; .......................

```
Now call the MultiDynamicTimelineTileBuilder widget inside your build class and display the data as shown below.

```flutter
 MultiDynamicTimelineTileBuilder(
                  itemCount: myEvents.keys.toList().length,
                  itemBuilder: (context, index) {

                    final date = myEvents.keys.toList()[index];
                    final eventsList = myEvents[date] ?? [];

                    return MultiDynamicTimeline(
                    // Displaying date list
                      starerDates: [date],

                      // Displaying event list from each date
                      eventsList: [
                        eventsList.map((exam) {
                          return EventCard(
                            cardColor: purple.withOpacity(0.05),
                            child: CustomEventTile2(
                              icon: MdiIcons.bookOutline,
                              title: exam.subject,
                              description: exam.description,
                            ),
                          );
                        }).toList()
                      ],
                    );
                  },
                ),

```

## DynamicTimelineTile widget contains : 

* breakDate
* indicatorColor
* indicatorWidth
* indicatorRadius
* crossSpacing
* mainSpacing
* dateStyle
* starerChild
* starerDates
* events

## breakDate (bool)

breakDate helps to break the date into two parts.

```flutter
DynamicTimelineTile(

    breakDate : true,

);

```



## indicatorColor (Color)

indicatorColor is a color property of the line between starerChild / starerDates and content. You can give your color to indicatorLine

```flutter
DynamicTimelineTile(

    indicatorColor : Colors.grey.shade300,
    
);

```

## indicatorWidth (double Width)

indicatorWidth helps you to increase the width of indicator line

```flutter
DynamicTimelineTile(

// Defines the weight of indicator line

    indicatorWidth : 4,
    
);

```

## indicatorRadius (Radius)

indicatorRadius helps you to increase the radius size of indicator line top attached circle

```flutter
DynamicTimelineTile(

    indicatorRadius : 4,
    
);

```

## crossSpacing (double width)

crossSpacing helps to create a horizontal space between the beforeLine, indicatorLine and afterLine child.

```flutter
DynamicTimelineTile(

    crossSpacing: 20,,
    
);

```

## mainSpacing (double height)

mainSpacing helps to create a vertical space between the two contents.

```flutter
DynamicTimelineTile(

    mainSpacing: 20,,
    
);

```

## dateStyle (TextStyle)

dateStyle helps to build a custom textstyle for starerDates texts.

```flutter
DynamicTimelineTile(

    dateStyle: TextStyle (
    color: black,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.4,
    fontSize: 22.sp,
    ),
    
);

```


## starerDates (List of String)

starerDates is a list of strings which contains the dates to be shown beforeLine. You can use starerChild to create your custom design or icon to show before the indicatorLine.

```flutter
DynamicTimelineTile(

    starerDates: [
    "2 jan",
    "12 jan",
    "17 jan",
    "27 Jan",
    ]

);

```



Either starerDates or starerChild can be used at a time. Both list are build at a samePlace so, both widgets cannot be used at a same time.


## starerChild (List of Widget)

starerChild is a list of widgets where you can create your custom widgets or ui in afterLine / content place.

```flutter
DynamicTimelineTile(

    starerDates: [
                    CustomIconChild(icon: Icons.cash),
                    CustomIconChild(icon: Icons.swapVertical),
                    CustomIconChild(icon: Icons.monitorAccount),
                    CustomIconChild(icon: Icons.earth),
                ]

);

```

## events (List of EventCard)

events is a list of EventCard which build the contentCard.

```flutter
DynamicTimelineTile(

    events: [    
    EventCard(),
    EventCard(),
    EventCard(),
    EventCard(),

            ]

);

```

Only event card can be used inside the eventsList...

## EventCard (Widget)

EventCard is nothing, just a widget which is used to build the content card.

```flutter
DynamicTimelineTile(

    EventCard(
    
    cardColor : Colors.grey.shade300,  // cardColor
    width : Mediaquery.of(context).size.width, // width of card
    verticalCardPadding : 12 // Vertical padding define a content padding from top and bottom.
    horizontalCardPadding : 12 // horizontal padding define a content padding from left and right.
    cardDecoration : BoxDecoration() // Allows you to decorate the eventcard mannually.
    cardRadius : BorderRadius.circular() // Allows you to create a radius to eventcard.
    child : child // Receive child widget for the content of EventCard

    );

);

NOTE : cardColor can only be used without the cardDecoration, otherwise using cardDecoration will create a new Ui.

```



## Feedback

If you have any feedback, please reach out to us at sujanpokhrelofc@gmail.com

