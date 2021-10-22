import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sweet_pet_mobile/util/colors/colors.dart';

class BasicDateField extends StatelessWidget {
  BasicDateField({required this.onChanged, required this.controller});

  final TextEditingController controller;
  final Function(DateTime?)? onChanged;

  final format = DateFormat("dd-MM-yyyy");

  InputDecoration get _defaultInputDecoration => InputDecoration(
        contentPadding:
            const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
        alignLabelWithHint: true,
        hintStyle: TextStyle(color: SweetPetColors.primary800),
        labelText: 'Data de Nascimento',
        labelStyle: TextStyle(color: SweetPetColors.primary800),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: SweetPetColors.primary800,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: SweetPetColors.primary800,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: SweetPetColors.primary800,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        format: format,
        controller: controller,
        onChanged: onChanged,
        decoration: _defaultInputDecoration,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime.now(),
          );
        },
      ),
    ]);
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}
