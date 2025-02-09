import 'package:flutter/cupertino.dart';

class PokeTextField extends StatefulWidget {
  final String placeholder;
  final String text;
  final ValueChanged<String> onChanged;

  const PokeTextField({
    super.key,
    required this.placeholder,
    required this.onChanged,
    this.text = '',
  });

  @override
  State<PokeTextField> createState() => _PokeTextFieldState();
}

class _PokeTextFieldState extends State<PokeTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _controller,
      prefix: Padding(
        padding: const EdgeInsets.only(left: 8, right: 4),
        child: Icon(
          CupertinoIcons.search,
          color: CupertinoColors.systemGrey3,
        ),
      ),
      placeholder: widget.placeholder,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(16),
      ),
      onChanged: widget.onChanged,
    );
  }
}
