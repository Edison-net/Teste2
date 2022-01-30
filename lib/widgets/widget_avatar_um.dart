import 'package:flutter/material.dart';

class AvatarUm extends StatelessWidget {
  int lugar;
  final Widget child;


  AvatarUm({required this.lugar, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80,
      width: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset(
                    'assets/avatar1.png',
                    width: 100,
                    height: 60,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Casa n° ',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  '$lugar',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          child
        ],
      ),
    );
  }
}
