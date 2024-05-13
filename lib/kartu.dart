import 'package:flutter/material.dart';

class Kartu extends StatelessWidget {
  const Kartu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, 
      height: 200,
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(20),),
      ),
      child: const Column(
        children: [
          Expanded(
            child: Icon(
              Icons.image_outlined,
              size: 70,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Switzerland', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),
              Icon(Icons.heart_broken, color: Colors.red,)
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amberAccent,),
              SizedBox(width: 30,),
              Text('4.8'),
            ],
          ),
        ],
      ),
    );
  }
}