import 'package:flutter/material.dart';
import 'package:sweet_pet_mobile/util/widgets/base_text_field_widget.dart';

class TextFieldWithValidationWidget extends StatelessWidget {
  const TextFieldWithValidationWidget({
    GlobalKey? key,
    this.initialValue,
    this.placeholder,
    this.isPassword = false,
    this.textInputAction,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onValidator,
    this.focusNode,
    this.messageError,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
  }) : super(key: key);

  final String? initialValue;
  final String? placeholder;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function? onValidator;
  final bool isPassword;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? messageError;
  final FloatingLabelBehavior floatingLabelBehavior;

  bool get isError {
    return messageError != null && messageError!.isNotEmpty;
  }

  Widget _showValidation(BuildContext context) {
    if (!isError) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).errorColor,
            size: 15,
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Text(
              messageError!,
              textAlign: TextAlign.left,
              softWrap: true,
              style: TextStyle(color: Theme.of(context).errorColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Column(
        children: [
          BaseTextFieldWidget(
            focusNode: focusNode,
            initialValue: initialValue,
            isPassword: isPassword,
            isError: isError,
            placeholder: placeholder,
            textInputAction: textInputAction,
            onChanged: onChanged,
            onEditingComplete: () {
              if (textInputAction == TextInputAction.next) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context).unfocus();
              }
              onValidator?.call();
              onEditingComplete?.call();
            },
            onSubmitted: onFieldSubmitted,
            floatingLabelBehavior: floatingLabelBehavior,
          ),
          Expanded(
            child: _showValidation(context),
          )
        ],
      ),
    );
  }
}
