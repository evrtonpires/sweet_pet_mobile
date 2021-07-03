import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final String? error;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool? campoObrigatorio;
  final Function(String)? onChanged;
  final bool? enable;
  final int? maxNumber;
  final double? fontSizehint;
  final bool? possuiMaxLines;
  final int? maxNumberLines;
  final bool? isHint;
  final bool? isOutlineInputBorder;
  final bool? obscureText;
  final bool? isFilled;
  final bool? isLoginPage;
  final IconData? iconPrefixo;
  final bool? isPassword;

  const TextFieldWidget(
      {Key? key,
      this.hint,
      this.error,
      this.controller,
      this.textInputType = TextInputType.text,
      this.campoObrigatorio = true,
      this.onChanged,
      this.enable = true,
      this.maxNumber = 8,
      this.fontSizehint = 12,
      this.possuiMaxLines = false,
      this.maxNumberLines = 8,
      this.isHint = false,
      this.isOutlineInputBorder = true,
      this.obscureText = false,
      this.isFilled = false,
      this.isLoginPage = false,
      this.isPassword = false,
      this.iconPrefixo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          enabled: enable,
          obscureText: obscureText == true ? true : false,
          maxLines: possuiMaxLines == true ? maxNumberLines : 1,
          cursorColor: Colors.white,
//         Colors.lightBlueAccent,
          // textAlign: TextAlign.center,
          maxLength: possuiMaxLines == true ? maxNumberLines : null,
          showCursor: true,
          decoration: InputDecoration(
              prefixIcon: isLoginPage == true
                  ? Icon(iconPrefixo, color: Colors.white70)
                  : SizedBox(),
              fillColor: Colors.black12,
              filled: isFilled == true ? true : false,
              suffixIcon: (campoObrigatorio == false && isPassword == false)
                  ? null
                  : isPassword == true
                      ? IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility_sharp,
                            color: Colors.white70,
                          ))
                      : Icon(
                          Icons.ac_unit,
                          size: 8,
                          color: Colors.red,
                        ),
              contentPadding: EdgeInsets.only(top: 10),
              labelText: isHint == true ? hint : "",
              helperText: isHint == false ? hint : "",
              helperStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              alignLabelWithHint: true,
              labelStyle: TextStyle(
                  color: isLoginPage == true ? Colors.white70 : Colors.black,
                  fontSize: fontSizehint),
              enabledBorder: isOutlineInputBorder == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.transparent
//                          Colors.lightBlueAccent,
                          ))
                  : UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xfff7892b)
//                            Colors.lightBlueAccent
                          )),
              focusedBorder: isOutlineInputBorder == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.transparent
//                          Colors.lightBlueAccent
                          ))
                  : UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xfff7892b)
//                          Colors.lightBlueAccent
                          )),
              errorText: error,
              errorStyle: TextStyle(color: Colors.red)),
          style: TextStyle(
              color: isLoginPage == true ? Colors.white : Colors.black),
          keyboardType: textInputType,
        ));
  }
}
