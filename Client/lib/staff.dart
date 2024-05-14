import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ViewStaff extends StatefulWidget {
  const ViewStaff({Key? key}) : super(key: key);

  @override
  _ViewStaffState createState() => _ViewStaffState();
}

class _ViewStaffState extends State<ViewStaff> {
  List<Map<String, dynamic>> staffList = [];

  void _fetchData() async {
    final dio = Dio();
    try {
      final response = await dio.get('https://consultancy-server.onrender.com/staffdetails');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        setState(() {
          staffList = List<Map<String, dynamic>>.from(data);
        });
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _deleteStaff(int index) async {
  final dio = Dio();
  final staffId = staffList[index]['_id'];

  try {
    final response = await dio.delete('https://consultancy-server.onrender.com/deletestaff/$staffId');
    if (response.statusCode == 200) {
     
      setState(() {
        staffList.removeAt(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Staff deleted successfully')),
      );
    } else {
      throw Exception('Failed to delete staff: ${response.statusCode}');
    }
  } catch (e) {
    print('Error deleting staff: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error deleting staff')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Staffs"),
      ),
      body: staffList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: staffList.length,
              itemBuilder: (context, index) {
                final staff = staffList[index];
                if (staff == null || staff.isEmpty) {
                  return SizedBox(); // Return an empty widget if staff is null or empty
                }

               return Card(
  elevation: 5,
  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  child: ListTile(
    contentPadding: const EdgeInsets.all(16),
    tileColor: Colors.white,
    leading: CircleAvatar(
      child: Text(
        staff['staffname']?[0] ?? '',
        style: const TextStyle(fontSize: 18),
      ),
    ),
    title: Text(staff['staffname'] ?? ''),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('StaffID: ${staff['staffID'] ?? ''}'),
        Text('Age: ${staff['age'] ?? ''}'),
        Text('Gender: ${staff['gender'] ?? ''}'),
        Text('Contact: ${staff['contact'] ?? ''}'),
      ],
    ),
    trailing: GestureDetector(
      onTap: () {
        _deleteStaff(index);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    ),
  ),
);

              },
            ),
    );
  }
}
