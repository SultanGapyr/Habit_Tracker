import 'package:flutter/material.dart';

class MyFloatinActionButton extends StatelessWidget {
  final Function()? onPressed;
  const MyFloatinActionButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
