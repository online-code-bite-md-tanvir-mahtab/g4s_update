class DetailItem {
  final String date;
  final String time;
  final String latitude;
  final String longtitide;
  final String code;
  final String g4SCode;
  final String remarks;
  final String locationImage;

  const DetailItem(
      {required this.code,
      required this.date,
      required this.time,
      required this.latitude,
      required this.longtitide,
      required this.g4SCode,
      required this.remarks,
      required this.locationImage});

  factory DetailItem.fromJson(Map<String, dynamic> json) {
    return DetailItem(
      code: json['code'] ?? " ",
      date: json['date'] ?? " ",
      time: json['time'] ?? " ",
      latitude: json['latitude'] ?? " ",
      g4SCode: json['g4SCode'] ?? " ",
      remarks: json['remarks'] ?? " ",
      longtitide: json['longtitide'] ?? "",
      locationImage: json['locationImage'] ?? "",
    );
  }
}
