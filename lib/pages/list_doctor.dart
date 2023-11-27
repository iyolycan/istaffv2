import 'package:flutter/material.dart';
import 'package:istaff/utils/constants.dart';
import 'package:istaff/utils/helper.dart';

class DoctorListScreen extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(name: 'Dr. John Doe', specialty: 'Psychiatrist'),
    Doctor(name: 'Dr. Jane Smith', specialty: 'Psychiatrist'),
    // Add more doctors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Constants.primaryColor,
        title: Text('Doctor List'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorCard(doctor: doctors[index]);
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          // You can replace this with the doctor's profile picture
          child: Text('Dr.'),
        ),
        title: Text(doctor.name),
        subtitle: Text(doctor.specialty),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                nextScreen(context, '/chat');
                // Implement chat functionality
                // You can navigate to a chat screen or show a modal
              },
            ),
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                // Implement phone call functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.video_call),
              onPressed: () {
                // Implement video call functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Doctor {
  final String name;
  final String specialty;

  Doctor({required this.name, required this.specialty});
}