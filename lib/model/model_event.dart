class Event {
  String name;
  DateTime startTime;
  DateTime endTime;
  Event(this.name, this.startTime, this.endTime);

  @override
  String toString() => name;
}