import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voiceforher/raisecomplaint.dart';

class ComplaintsScreen extends StatefulWidget {
  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  // Firestore reference to the complaints collection
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Girl Safety Complaints',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue, // Blue theme for AppBar
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.blue.shade50, // Light blue background for the body
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const Text(
                  'Current Complaints',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                // StreamBuilder for current complaints
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('complaints')
                      .where('status', isEqualTo: 'current')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Text(
                        'Error fetching complaints.',
                        style: TextStyle(color: Colors.red),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Text(
                        'No current complaints available.',
                        style: TextStyle(color: Colors.grey),
                      );
                    } else {
                      return _buildComplaintList(snapshot.data!.docs);
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Past Complaints',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                // StreamBuilder for past complaints
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('complaints')
                      .where('status', isEqualTo: 'past')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Text(
                        'Error fetching complaints.',
                        style: TextStyle(color: Colors.red),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Text(
                        'No past complaints available.',
                        style: TextStyle(color: Colors.grey),
                      );
                    } else {
                      return _buildComplaintList(snapshot.data!.docs);
                    }
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width * 0.5 - 90,
            child: SizedBox(
              width: 180,
              child: ElevatedButton(
                onPressed: _raiseComplaint,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Raise a Complaint',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _raiseComplaint() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Raisecomplaint(),
      ),
    );
  }

  // Function to build the list of complaints
  Widget _buildComplaintList(List<QueryDocumentSnapshot> complaints) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: complaints.length,
      itemBuilder: (context, index) {
        final complaint = complaints[index];
        String complaintTitle = complaint['title'];
        String complaintDate = complaint['date'];
        String complaintDetails = complaint['details'];

        return Card(
          color: Colors.white, // White background for complaint cards
          margin: const EdgeInsets.symmetric(vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(
              complaintTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            subtitle: Text(
              'Date: $complaintDate',
              style: TextStyle(color: Colors.grey.shade700),
            ),
            leading: Icon(
              Icons.report_problem,
              color: Colors.blue,
            ),
            onTap: () => _showComplaintDetails(
              context,
              complaintTitle,
              complaintDate,
              complaintDetails,
            ),
          ),
        );
      },
    );
  }

  // Function to show complaint details
  void _showComplaintDetails(
      BuildContext context, String title, String date, String details) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(color: Colors.blue),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date: $date',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 10),
              Text(
                'Details: $details',
                style: const TextStyle(color: Colors.black87),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}
