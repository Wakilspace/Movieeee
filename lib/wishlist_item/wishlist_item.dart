
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      { Key? key, required this.screenSize, required this.images, required this.itemName, required this.del})
      : super(key: key);

  final Size screenSize;
  final String images;
  final String itemName;
  final String del;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: screenSize.height * 0.15,
      width: screenSize.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.blue[200]!.withOpacity(0.3),
                offset: const Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            images,
            height: screenSize.height * 0.13,
            width: screenSize.width * 0.3,
            fit: BoxFit.cover
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            itemName,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ]),
    );
  }
}