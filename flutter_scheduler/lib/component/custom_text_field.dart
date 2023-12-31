import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scheduler/const/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;

  // true - 시간, false - 내용
  final bool isTime;

  const CustomTextField({required this.label, required this.isTime, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        if(isTime) renderTextField(),
        if(!isTime)
          Expanded(
            child: renderTextField(),
          ),
      ],
    );
  }

  Widget renderTextField() {
    return TextField(
      cursorColor: Colors.grey,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      expands: !isTime,
      maxLines: isTime ? 1 : null,
      inputFormatters:
      isTime ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}
