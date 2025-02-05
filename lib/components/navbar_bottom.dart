import 'package:flutter/material.dart';

class NavbarBottom extends StatefulWidget {
  final Function(String) onAddTodo;
  const NavbarBottom({super.key, required this.onAddTodo});

  @override
  State<NavbarBottom> createState() => _NavbarBottomState();
}

class _NavbarBottomState extends State<NavbarBottom> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, -2), // Ombre vers le haut
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Add a new todo...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8), // Espacement entre l'input et le bouton
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                widget.onAddTodo(_controller.text);
                _controller.clear();
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Icon(Icons.add, size: 24),
          ),
        ],
      ),
    );
  }
}
