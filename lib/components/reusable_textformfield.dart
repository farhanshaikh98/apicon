import 'package:flutter/material.dart';

import '../constants/strings.dart';

class ReusableTextFormField extends StatefulWidget {
  const ReusableTextFormField({
    super.key,
    this.margin,
    this.controller,
    this.emptyMassage,
    this.enabled,
    this.keyboardtype,
    this.maxline,
    this.hintext,
    this.onchange,
    this.validation,
    required this.textcapitalization,
    this.onFieldSubmitted,
    this.focusNode,
    this.suffixstring,
    this.suffixstyle,
    this.suffixIcon,
    required this.obscureText,
  });

  final EdgeInsets? margin;
  final TextEditingController? controller;
  final String? emptyMassage;
  final bool? enabled;
  final ValueChanged? onchange;
  final TextInputType? keyboardtype;
  final int? maxline;
  final String? suffixstring;
  final String? hintext;
  final String? Function(String?)? validation;
  final TextCapitalization textcapitalization;
  final Function? onFieldSubmitted;
  final FocusNode? focusNode;

  final TextStyle? suffixstyle;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  State<ReusableTextFormField> createState() => ReusableTextFormFieldState();
}

class ReusableTextFormFieldState extends State<ReusableTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        textCapitalization: widget.textcapitalization,
        enabled: widget.enabled,
        onChanged: widget.onchange,
        obscureText: widget.obscureText,
        validator: ((value) {
          if (value == null || value.isEmpty) {
            return widget.emptyMassage ?? ReusableString.fieldEmptyErrorMsg;
          } else {
            return null;
          }
        }),
        onFieldSubmitted: (String s) {
          widget.onFieldSubmitted!();
        },
        focusNode: widget.focusNode,
        autofocus: true,
        maxLines: widget.maxline ?? 1,
        controller: widget.controller,
        keyboardType: widget.keyboardtype,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            suffixText: widget.suffixstring,
            hintText: widget.hintext,
            prefixIcon: widget.suffixIcon,
            contentPadding: EdgeInsets.all(8.0),
            border: InputBorder.none,
            fillColor: Color.fromARGB(255, 244, 241, 241),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                width: 0,
                color: Color.fromARGB(255, 224, 224, 224),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                width: 0,
                color: Color.fromARGB(255, 224, 224, 224),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                width: 0,
                color: Color.fromARGB(255, 224, 224, 224),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                width: 0,
                color: Color.fromARGB(255, 224, 224, 224),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                width: 0,
                color: Color.fromARGB(255, 224, 224, 224),
              ),
            ),
            labelStyle: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}
