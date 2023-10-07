import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _ForumsState();
}

class _ForumsState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    final event = CalendarEventData(
      title: 'python',
      date: DateTime(2023, 10, 6),
      endTime: DateTime(
        2023,
        10,
        6,
      ),
      event: "seance 1",
    );

    CalendarControllerProvider.of(context).controller.add(event);
    return WeekView(
      controller: EventController(),
      eventTileBuilder: (date, events, boundry, start, end) {
        // Return your widget to display as event tile.
        return Container();
      },
      fullDayEventBuilder: (events, date) {
        // Return your widget to display full day event view.
        return Container();
      },
      showLiveTimeLineInAllDays:
          true, // To display live time line in all pages in week view.
      width: 400, // width of week view.
      minDay: DateTime(2023, 10, 1),
      maxDay: DateTime(2050),
      initialDay: DateTime(2023),
      heightPerMinute: 1, // height occupied by 1 minute time span.
      eventArranger:
          SideEventArranger(), // To define how simultaneous events will be arranged.
      onEventTap: (events, date) => print(events),
      onDateLongPress: (date) => print(date),
      startDay: WeekDays.sunday, // To change the first day of the week.
    );
  }
}
