import 'package:g4s_attendance_applicaton/util/result.dart';

class UserInfo {
  final bool success;
  final int code;
  final Result result;

  const UserInfo({
    required this.success,
    required this.code,
    required this.result,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      success: json['success'] ?? '',
      code: json['code'] ?? '',
      result: Result.formJson(json['result']),
    );
  }
}
