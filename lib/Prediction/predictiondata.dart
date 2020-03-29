class Predictiondata {
  final int cars;
  final String day;
  Predictiondata(this.cars,this.day);

  Predictiondata.fromMap(Map<String, dynamic> map)
      : assert(map['cars'] != null),
        assert(map['day'] != null),
        cars = map['cars'],
        day = map['day'];

  @override
  String toString() => "Record<$cars:$day>";
}