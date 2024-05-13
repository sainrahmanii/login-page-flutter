import 'package:flutter/material.dart';

class KartuEwallet extends StatelessWidget {
  const KartuEwallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Waller App Design', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18
                ),
              ),
              Text('3d', style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Text(
            'Team Members',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(
                Icons.timelapse,
                color: Colors.white,
              ),
              SizedBox(width: 5,),
              Text(
                '08.00 - 18.00 (P.M)',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}