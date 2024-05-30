// import 'package:g4s_attendance_applicaton/util/attendaceinfo.dart';
import 'package:g4s_attendance_applicaton/util/leaveitem.dart';

class LeaveInfo {
  final bool success;
  final int code;
  final List<LeaveItem> result;

  LeaveInfo({
    required this.success,
    required this.code,
    required this.result,
  });

  factory LeaveInfo.fromJson(Map<String, dynamic> json) {
    return LeaveInfo(
      success: json['success'] ?? false,
      code: json['code'] ?? 0,
      result: List<LeaveItem>.from((json['result'] as List<dynamic>)
          .map((item) => LeaveItem.fromJson(item))),
    );
  }
}
