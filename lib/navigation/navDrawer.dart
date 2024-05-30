import 'package:flutter/material.dart';
import 'package:g4s_attendance_applicaton/screen/attendance.dart';
import 'package:g4s_attendance_applicaton/screen/homescreen.dart';
import 'package:g4s_attendance_applicaton/screen/leave.dart';
import 'package:g4s_attendance_applicaton/screen/loginscreen.dart';
// import 'package:g4s_attendance_applicaton/screen/profilescreen.dart';
import 'package:g4s_attendance_applicaton/screen/testProfile.dart';
import 'package:g4s_attendance_applicaton/util/info.dart';
import 'package:g4s_attendance_applicaton/util/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,
    required this.navToken,
    required this.navInfo,
    required this.navUserName,
  });
  final Token navToken;
  final UserInfo navInfo;
  final String navUserName;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image(
              image: AssetImage('images/symphony-logo.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              token: navToken, userName: navUserName),
                        ));
                  },
                  leading: Icon(
                    Icons.home,
                    color: Color(0xFF00ff29),
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestProfile(
                            info: navInfo,
                            userName: navUserName,
                            token: navToken),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Color(0xFF00ff29),
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlertDialogExampleApp(
                          userName: navUserName,
                          token: navToken,
                          userInfo: navInfo,
                        ),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.check,
                    color: Color(0xFF00ff29),
                  ),
                  title: Text(
                    "Attendance",
                    style: TextStyle(
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeaveDialogExampleapp(
                          mToken: navToken,
                          mUserName: navUserName,
                          mUserInof: navInfo,
                        ),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.check,
                    color: Color(0xFF00ff29),
                  ),
                  title: Text(
                    "Leave",
                    style: TextStyle(
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.remove('token');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Color(0xFF00ff29),
                  ),
                  title: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
