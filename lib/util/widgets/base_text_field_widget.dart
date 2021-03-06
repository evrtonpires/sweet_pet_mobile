import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';

class BaseTextFieldWidget extends StatefulWidget {
  const BaseTextFieldWidget({
    this.controller,
    this.placeholder,
    this.initialValue,
    this.isPassword = false,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.textInputAction,
    this.isError = false,
    this.isEnable = true,
    this.focusNode,
    this.showCursor = true,
    this.floatingLabelBehavior,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? placeholder;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onSubmitted;
  final bool isPassword;
  final bool isError;
  final bool? isEnable;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool showCursor;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  _BaseTextFieldWidgetState createState() => _BaseTextFieldWidgetState();
}

class _BaseTextFieldWidgetState extends State<BaseTextFieldWidget> {
  Widget get _iconPasswordHidden => Icon(
    Icons.remove_red_eye_outlined,
        semanticLabel: 'Exibir senha',
        color: SweetPetColors.purple,
      );

  Widget get _iconPasswordShowed =>
      Icon(
        Icons.remove_red_eye,
        semanticLabel: 'Esconder senha',
        color: SweetPetColors.purpleLight,
      );

  bool _isObscured = false;

  Widget get _togglePasswordSuffix =>
      GestureDetector(
        child: _isObscured ? _iconPasswordHidden : _iconPasswordShowed,
        onTap: () =>
            setState(
                  () => _isObscured = !_isObscured,
            ),
      );

  InputDecoration get _errorInputDecoration =>
      InputDecoration(
        contentPadding: const EdgeInsets.only(
          top: 0,
          left: 10,
          right: 10,
          bottom: 0,
        ),
        alignLabelWithHint: true,
        labelText: widget.placeholder,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: SweetPetColors.purple,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: SweetPetColors.purple,
          ),
        ),
        labelStyle: TextStyle(color: SweetPetColors.purple),
        suffixIcon: widget.isPassword ? _togglePasswordSuffix : null,
      );

  InputDecoration get _defaultInputDecoration => InputDecoration(
    contentPadding:
            const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
        alignLabelWithHint: true,
        labelText: widget.placeholder,
        labelStyle: TextStyle(color: SweetPetColors.purple),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: SweetPetColors.purple),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: SweetPetColors.purple),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelBehavior: widget.floatingLabelBehavior,
        suffixIcon: widget.isPassword ? _togglePasswordSuffix : null,
      );

  @override
  void initState() {
    if (widget.isPassword) {
      _isObscured = true;
    }
    widget.controller!.text = widget.initialValue ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: SweetPetColors.purple,
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        obscureText: _isObscured,
        textInputAction: widget.textInputAction,
        showCursor: widget.showCursor,
        enabled: widget.isEnable,
        decoration:
            widget.isError ? _errorInputDecoration : _defaultInputDecoration,
        cursorColor: SweetPetColors.purple,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onSubmitted,
      ),
    );
  }

  @override
  void dispose() {
    widget.controller!.clear();
    if (widget.focusNode != null) {
      widget.focusNode!.dispose();
    }
    super.dispose();
  }
}
