import 'package:flutter_doctime/consts/consts.dart';

class CustomTextfield extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final Color textColor;
  final Color borderColor;
  const CustomTextfield(
      {super.key,
      required this.hint,
      this.textController,
      this.textColor = Colors.black,
      this.borderColor = Colors.black});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      cursorColor: AppColors.blueColor,
      decoration: InputDecoration(
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: widget.borderColor,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor)),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: widget.textColor,
          )),
    );
  }
}
