import 'package:flutter/material.dart';
import 'package:task/core/constatns.dart';
import 'package:task/view/widgets/profile_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileContainer(),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.alarm,
                    size: 28,
                    color: containerFirstColor,
                  ),
                  title: Text(
                    "History",
                    style: profileText,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.store,
                    size: 28,
                    color: containerFirstColor,
                  ),
                  title: Text(
                    "Bank Details",
                    style: profileText,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    size: 28,
                    color: containerFirstColor,
                  ),
                  title: Text(
                    "Notifications",
                    style: profileText,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.security,
                    size: 28,
                    color: containerFirstColor,
                  ),
                  title: Text(
                    "Security",
                    style: profileText,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    size: 28,
                    color: containerFirstColor,
                  ),
                  title: Text(
                    "Help and Support",
                    style: profileText,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.portrait,
                    size: 28,
                    color: containerFirstColor,
                  ),
                  title: Text(
                    "Terms and Conditions",
                    style: profileText,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 28,
                    color: logoutColor,
                  ),
                  title: Text(
                    "Logout",
                    style: profileText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
