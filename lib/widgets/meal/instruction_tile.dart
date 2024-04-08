import 'package:flutter/material.dart';

class InstructionTile extends StatelessWidget {
  final String instruction;
  const InstructionTile({super.key, required this.instruction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          instruction,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
