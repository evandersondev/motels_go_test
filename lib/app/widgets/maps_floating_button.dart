import 'package:flutter/material.dart';

class MapsFloatingButton extends StatelessWidget {
  const MapsFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      backgroundColor: Colors.white,
      elevation: 2,
      icon: Icon(
        Icons.map_outlined,
        color: Theme.of(context).colorScheme.primary,
        size: 16,
      ),
      label: Text(
        'mapa',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
