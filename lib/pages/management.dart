import 'package:flutter/material.dart';
import 'package:istaff/utils/constants.dart';

class ManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ManagementCard(
              title: 'Attendance Management',
              icon: Icons.access_time,
            ),
            ManagementCard(
              title: 'Leave Management',
              icon: Icons.date_range,
            ),
            ManagementCard(
              title: 'Payslip',
              icon: Icons.attach_money,
            ),
            ManagementCard(
              title: 'Tasks',
              icon: Icons.assignment,
            ),
          ],
        ),
      ),
    );
  }
}

class ManagementCard extends StatelessWidget {
  final String title;
  final IconData icon;

  ManagementCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(icon, size: 40.0),
        title: Text(title),
        onTap: () {
          // Add navigation or functionality for each card
          // For example, you can navigate to a specific screen for each management category
        },
      ),
    );
  }
}