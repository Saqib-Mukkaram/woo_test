import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// typedef FormValidatorCallback = String? Function(String? value);

class InputField extends StatefulWidget {
  final String placeholderText;
  final TextEditingController fieldController;
  final double width;
  final double height;
  final double fieldPaddingleft;
  final double fieldPaddingright;
  final double suffixIconImageWidth;
  final double suffixIconImageHeight;
  final double sufficIconPadding;
  final String? suffixIconImage;
  final String? prefixIconImage;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool expands;
  final int maxlines;
  final Color focusedBorder;
  final double filledOpacity;
  final Color fillColor;
  final Color hintTextColor;
  final bool isBorder;

  // late final GlobalKey<FormState> formKey;

  InputField({
    Key? key,
    // required this.formKey,
    required this.placeholderText,
    required this.fieldController,
    this.width = double.infinity,
    this.fieldPaddingleft = 16,
    this.fieldPaddingright = 16,
    this.suffixIconImage,
    this.height = 60,
    this.prefixIconImage,
    this.suffixIconImageHeight = 20,
    this.suffixIconImageWidth = 30,
    this.sufficIconPadding = 8,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.expands = false,
    this.maxlines = 1,
    this.focusedBorder = Colors.grey,
    this.filledOpacity = 1,
    this.fillColor = Colors.white,
    this.hintTextColor = const Color(0xff000000),
    this.isBorder = true,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    Widget? suffixImage;
    if (widget.suffixIconImage != null) {
      suffixImage = Padding(
        padding: EdgeInsets.all(widget.sufficIconPadding),
        child: Image.asset(
          widget.suffixIconImage!,
          width: widget.suffixIconImageWidth,
          height: widget.suffixIconImageHeight,
        ),
      );
    }

    Widget? prefixImage;
    if (widget.prefixIconImage != null && widget.prefixIconImage!.isNotEmpty) {
      prefixImage = Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          widget.prefixIconImage!,
          width: 30,
          height: 20,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.fieldPaddingleft,
        0,
        widget.fieldPaddingright,
        0,
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        child: TextFormField(
          onChanged: (value) {},
          minLines: widget.expands ? null : 1,
          maxLines: widget.expands ? null : widget.maxlines,
          expands: widget.expands,
          // style: GoogleFonts.poppins(
          //     // fontSize: 14,
          //     ),
          controller: widget.fieldController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This is a required field.';
            } else {
              return null;
            }
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor,
              border: widget.isBorder
                  ? OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.isBorder
                        ? widget.focusedBorder
                        : Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              )
                  : UnderlineInputBorder(
                borderSide: BorderSide(
                    width: 0,
                    color: widget.isBorder
                        ? widget.focusedBorder
                        : Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              focusedBorder: OutlineInputBorder(

              ),
              // UnderlineInputBorder(
              //
              //   borderSide: BorderSide(
              //       color: widget.isBorder
              //           ? Colors.white
              //           : Colors.transparent),
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(16),
              //   ),
              // ),
              errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        // errorText: "This is a requirement",
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        hintText: widget.placeholderText,
        hintStyle: TextStyle(
          color: widget.hintTextColor,
        ),
        suffixIcon: suffixImage,
        prefixIcon: prefixImage,
      ),
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      // Hides entered characters
    ),)
    ,
    );
  }
}
