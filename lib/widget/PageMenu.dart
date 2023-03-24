import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class PageMenu extends StatelessWidget {
  const PageMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 3,
                blurRadius: 2,
                offset: Offset(0, 7),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.catching_pokemon,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          print("Work");
        },
      ),
    );
  }
}
