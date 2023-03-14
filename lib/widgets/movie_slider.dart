import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  width: 190,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
