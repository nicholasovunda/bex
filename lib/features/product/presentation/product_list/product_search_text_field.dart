import 'package:flutter/material.dart';

class ProductSearchTextField extends StatefulWidget {
  const ProductSearchTextField({super.key});

  @override
  State<ProductSearchTextField> createState() => _ProductSearchTextFieldState();
}

class _ProductSearchTextFieldState extends State<ProductSearchTextField> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (context, value, _) {
        return TextField(
          controller: _controller,
          autofocus: false,
          style: const TextStyle(color: Colors.black, fontSize: 12.0),
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontSize: 16,
            ),
            hintText: 'Search Product',
            icon: const Icon(Icons.search),
            suffixIcon: value.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
          ),
          onChanged: null,
        );
      },
    );
  }
}
