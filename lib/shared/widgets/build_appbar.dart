import 'package:flutter/material.dart';

Widget buildAppBar() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.more_vert),
                Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.qr_code_scanner,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }