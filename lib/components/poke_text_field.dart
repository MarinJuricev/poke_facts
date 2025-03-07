import 'package:flutter/cupertino.dart';

class PokeTextField extends StatefulWidget {
  final bool autofocus;
  final String placeholder;
  final String text;
  final ValueChanged<String> onChanged;

  const PokeTextField({
    super.key,
    required this.placeholder,
    required this.onChanged,
    this.text = '',
    this.autofocus = false,
  });

  @override
  State<PokeTextField> createState() => _PokeTextFieldState();
}

class _PokeTextFieldState extends State<PokeTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
    _focusNode = FocusNode();
    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void didUpdateWidget(covariant PokeTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _controller.text = widget.text;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      autofocus: widget.autofocus,
      focusNode: _focusNode,
      controller: _controller,
      prefix: Padding(
        padding: const EdgeInsets.only(left: 8, right: 4),
        child: Icon(CupertinoIcons.search, color: CupertinoColors.systemGrey3),
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
