// import 'package:intl/intl.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() async {
  // actionofAdminRejected('1_0', '38065', 'admin', false, true);
  // await getAttendanceInfo("admin");
  // getAttendanceInfo("dev-1016").then((value) {});
  // DateTime currentTime = DateTime.now();
  // var time = "9:00 AM".split("AM")[0].split(":");
  // print(time);
  // // DateTime currentTime = DateTime.now();
  // // Create a DateTime object for "9:00 AM" today
  // DateTime targetTime = DateTime(
  //   currentTime.year,
  //   currentTime.month,
  //   currentTime.day,
  //   int.parse(time[0]),
  //   int.parse(time[1]),
  // );
  // print(targetTime);
  // // // Add an additional duration, for example, 30 minutes
  // Duration additionalDuration = Duration(minutes: 50);
  // DateTime adjustedTargetTime = targetTime.add(additionalDuration);

  // // Check if the current time is equal to or after the adjusted target time
  // bool isAfterOrEqual = currentTime.isAfter(adjustedTargetTime) ||
  //     currentTime.isAtSameMomentAs(adjustedTargetTime);

  // // Print the result
  // // print('Is it after or equal to 9:30 AM? $isAfterOrEqual');
  // print(isAfterOrEqual);

  uploadImage(
      File("D:/DotNetProjectHRMandAPI/g4s_attendance_application/tanvir.jpg"));
}

Future<void> uploadImage(File imageFile) async {
  // print("Image path : ${imageFile.path}");
  // // Replace 'your_api_endpoint' with the actual API endpoint URL

  var formattedDate = DateFormat('yyyyMMdd').format(DateTime.now());
  final apiUrl = Uri.parse(
      'http://116.206.56.102:8086/api/Attendance/InsertCaptcherImage');

  try {
    var request = http.MultipartRequest('POST', apiUrl);
    request.headers["Authorization"] =
        'bearer SfLnUDBk0GzTo6UaPa43YO6JDEO2tXYXSVJzv3KJ5oNlbcwiW5UTbOrslk9KTq6Pdu22fldyPIkz05ec8L47SIW8uIk_vNKoqY-j5cBOOjzA-0gNVLp65WSOp7xuf-JkhI4CHuUPP_zq_HA8w5OCHFKnGXoMkNNMPeikHyZGbuJUh0sSuxqx4Obj1Wb_EDKTJ24oCsMqTMD49a7OEXOgzg';
    // Send the request
    var response = await http.MultipartFile.fromBytes(
        'picture', imageFile.readAsBytesSync());
    request.files.add(response);
    // print("Image path : ${imageFile.path}");
    var res = await request.send();
    print(res.statusCode);
    // Check the response
    if (res.statusCode == 200) {
      print('Image uploaded successfully' + await res.stream.bytesToString());
    } else {
      print('Failed to upload image. Status code: ${formattedDate.toString()}');
    }
  } catch (e) {
    print('Error uploading image: $e');
  }
}
