import 'package:flutter/material.dart';
import 'package:punyam/src/modules/store/controller/store_controller.dart';
import '../../../app/app.dart';

class RecentSearchCard extends StatelessWidget {
  final String searchName;
  final VoidCallback onDelete;

  const RecentSearchCard({
    required this.searchName,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Text(
            searchName,
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          GestureDetector(
            onTap: onDelete,
            child: Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}
