class Reminder {
  final String title;
  String description;
  DateTime date;
  String time;
  final String rID;
  DateTime timeStamp;

  Reminder({
    required this.title,
    required this.date,
    required this.time,
    this.description = '',
    required this.timeStamp,
  }) : rID = timeStamp.toString();
}
