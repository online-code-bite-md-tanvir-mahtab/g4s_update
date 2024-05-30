import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UrlManager {
  final token_url = 'http://116.206.56.102:8086';
  // final token_url = 'http://localhost:64662';
  final userprofile_url = '';
  final attendance_url = 'http://[::1]:90';
  final dynamic_img_url =
      'https://symphonysofttech.com/wp-content/webpc-passthru.php?src=https://symphonysofttech.com/wp-content/uploads/2021/02/SymLogo-e1593672366337.png&nocache=1';
  final dynamic_client_img_url = 'images/tanvirCodder.png';

  bool isAuthenticated = false;

  void dateFormater() {
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(Duration(days: 30));
    String current_day = DateFormat('yyyyMMdd').format(today);
    String one_month_ago = DateFormat('yyyyMMdd').format(oneMonthAgo);
    print(current_day);
    print(one_month_ago);
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop(BuildContext context) async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press back again to exit.'),
        ),
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
