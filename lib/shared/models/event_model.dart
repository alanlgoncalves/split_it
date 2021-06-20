class EventModel {
  final String title;
  final DateTime createdAt;
  final double value;
  final int friends;

  EventModel(
      {required this.title,
      required this.createdAt,
      required this.value,
      required this.friends});
}
