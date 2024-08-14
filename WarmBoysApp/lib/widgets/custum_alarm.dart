import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/custom_auth_provider.dart';
import '../screens/notification/notification_page.dart';

class CustomAlarmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<CustomAuthProvider>(context, listen: false).uid;

    if (userId == null) {
      return _buildIconButton(context, false);
    }

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('alarms')
          .doc(userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return _buildIconButton(context, false);
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        final hasNewAlarms = data['hasNewAlarms'] == true;
        return _buildIconButton(context, hasNewAlarms);
      },
    );
  }

  Widget _buildIconButton(BuildContext context, bool hasNewAlarms) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationPage(),
              ),
            );
          },
        ),
        if (hasNewAlarms)
          Positioned(
            right: 11,
            top: 11,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: BoxConstraints(
                minWidth: 14,
                minHeight: 14,
              ),
              child: Text(
                '!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}