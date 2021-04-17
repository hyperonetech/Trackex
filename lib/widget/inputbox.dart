import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trackex/theme/colors.dart';
import 'package:trackex/theme/Style.dart';

class inputBox extends StatefulWidget {
  TextEditingController controller;
  String labelText, errorText;
  Function onchanged;
  List<TextInputFormatter> inuptformat;
  bool obscureText, error;
  bool ispassword = false;
  bool istextarea = false;
  bool readonly = false;
  int minLine;
  inputBox(
      {this.controller,
      this.labelText,
      this.error,
      this.errorText,
      this.inuptformat,
      this.obscureText,
      this.ispassword,
      this.istextarea,
      this.readonly,
      this.minLine,
      this.onchanged});

  @override
  _inputBoxState createState() => _inputBoxState();
}

class _inputBoxState extends State<inputBox> {
  bool error, obscureText, hidepass = false;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.obscureText) {
      setState(() {
        hidepass = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: widget.controller,
      cursorColor: primary,
      obscureText: hidepass,
      onChanged: widget.onchanged,
      inputFormatters: widget.inuptformat,
      maxLines: widget.istextarea ? null : 1,
      textAlignVertical: TextAlignVertical.top,
      readOnly: widget.readonly,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      decoration: InputDecoration(
        focusColor: black,
        fillColor: grey,
        errorText: widget.error ? widget.errorText : null,

        contentPadding: EdgeInsets.all(subMargin + 4),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: black, fontSize: subMargin + 2),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: BorderSide(width: 2, color: primary),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: BorderSide(width: 1, color: grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: BorderSide(width: 1, color: black),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
            borderSide: BorderSide(
              width: 1,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
            borderSide: BorderSide(width: 1.5, color: errorColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
            borderSide: BorderSide(width: 2, color: errorColor)),
        //  isDense: true,
        errorStyle: TextStyle(color: errorColor, height: 0),
        alignLabelWithHint: true,

        suffixIcon: widget.ispassword
            ? IconButton(
                onPressed: () {
                  if (widget.ispassword) {
                    setState(() {
                      if (hidepass == true) {
                        hidepass = false;
                      } else {
                        hidepass = true;
                      }
                    });
                  }
                },
                splashColor: Colors.transparent,
                icon: Icon(
                  hidepass ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: widget.ispassword ? black.withOpacity(0.6) : white,
                ),
              )
            : null,
      ),
    );
  }
}

SnackBar redsnackBar(String text) {
  return SnackBar(
    content: Text(text),
    backgroundColor: errorColor,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(20),
    duration: Duration(seconds: 1),
  );
}

SnackBar greensnackBar(String text) {
  return SnackBar(
    content: Text(text),
    backgroundColor: succses,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(20),
    duration: Duration(seconds: 1),
  );
}

Center greenProgressBar() {
  return Center(
      child: Container(
    width: 60,
    height: 60,
    child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(primary),
      backgroundColor: grey,
    ),
  ));
}

Center progressBar() {
  return Center(
      child: Container(
    width: 60,
    height: 60,
    child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(primary),
      backgroundColor: grey,
    ),
  ));
}
