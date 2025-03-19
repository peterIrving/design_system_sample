import 'package:flutter/material.dart';

class ButtonExamples extends StatelessWidget {
  const ButtonExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Elevated Buttons
          const Text(
            'Elevated Buttons',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Primary'),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('With Icon'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: null,
                child: const Text('Disabled'),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Outlined Buttons
          const Text(
            'Outlined Buttons',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text('Secondary'),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.star),
                label: const Text('With Icon'),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: null,
                child: const Text('Disabled'),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Text Buttons
          const Text(
            'Text Buttons',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Tertiary'),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info),
                label: const Text('With Icon'),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: null,
                child: const Text('Disabled'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
