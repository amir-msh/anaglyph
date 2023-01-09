import 'package:flutter/material.dart';

enum ArrowDirection {
  left,
  right,
}

class ArrowButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final ArrowDirection direction;
  const ArrowButton({
    this.onPressed,
    required this.direction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: direction == ArrowDirection.right
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: Ink(
            decoration: ShapeDecoration(
              color: Theme.of(context).primaryColor,
              shape: const CircleBorder(),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: direction == ArrowDirection.right
                  ? const Icon(Icons.arrow_right_rounded)
                  : const Icon(Icons.arrow_left_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
