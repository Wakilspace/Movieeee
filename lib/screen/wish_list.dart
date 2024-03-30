import 'package:flutter/material.dart';
import 'package:movie_app1/wishlist_item/wishlist_item.dart';
import 'package:provider/provider.dart';
import 'package:movie_app1/provider/pro_stack.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Consumer<ProviderVM>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: screenSize.height,
            width: double.infinity,
            child: ListView.builder(
              itemCount: value.lst.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    value.del(index);
                  },
                  child: CartItem(
                    screenSize: screenSize,
                    images: value.lst[index].imagePath,
                    itemName: value.lst[index].name, del: '',
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}