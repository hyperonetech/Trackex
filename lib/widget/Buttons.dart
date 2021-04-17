import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  String title;
  Function onPressed;
  bool isloading;
  double width;
  Color foregroundColor, backgroundColor;
  double fontsize;
  double height;
  double borderRadius;

  PrimaryButton(
      {this.title,
      this.width,
      this.onPressed,
      this.foregroundColor,
      this.backgroundColor,
      this.fontsize,
      this.height,
      this.borderRadius,
      this.isloading});
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isloading ? null : widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius == null
                ? widget.height / 2
                : widget.borderRadius)),
        height: widget.height == null ? 50 : widget.height,
        width: widget.width != null
            ? widget.width
            : MediaQuery.of(context).size.width,
        child: Center(
          child: widget.isloading
              ? Center(
                  child: Container(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        widget.foregroundColor),
                    backgroundColor: widget.backgroundColor,
                  ),
                ))
              : Text(
                  widget.title,
                  style: TextStyle(
                      color: widget.foregroundColor,
                      fontSize: widget.fontsize == null ? 24 : widget.fontsize,
                      fontWeight: FontWeight.w700),
                ),
        ),
      ),
    );
  }
}

// class BorderedButton extends StatefulWidget {
//   String title;
//   Function onPressed;
//   bool isloading;
//   double width;
//   double fontsize;
//   Color foregroundColor, backgroundColor;
//   double height;

//   BorderedButton(
//       {this.title,
//       this.width,
//       this.onPressed,
//       this.foregroundColor,
//       this.backgroundColor,
//       this.fontsize,
//       this.height,
//       this.isloading});
//   @override
//   _BorderedButtonState createState() => _BorderedButtonState();
// }

// class _BorderedButtonState extends State<BorderedButton> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: widget.isloading ? null : widget.onPressed,
//       child: Container(
//         decoration: BoxDecoration(
//             color: widget.backgroundColor,
//             border: Border.all(width: 2, color: widget.foregroundColor),
//             borderRadius: BorderRadius.circular(buttonRadius)),
//         height: widget.height == null ? 60 : widget.height,
//         width: widget.width != null
//             ? widget.width
//             : MediaQuery.of(context).size.width,
//         child: Center(
//           child: widget.isloading
//               ? Center(
//                   child: Container(
//                   width: 40,
//                   height: 40,
//                   child: CircularProgressIndicator(
//                     valueColor: new AlwaysStoppedAnimation<Color>(
//                         widget.foregroundColor),
//                     backgroundColor: widget.backgroundColor,
//                   ),
//                 ))
//               : Text(
//                   widget.title,
//                   style: TextStyle(
//                       color: widget.foregroundColor,
//                       fontSize: widget.fontsize == null
//                           ? buttonTextSize
//                           : widget.fontsize,
//                       fontWeight: FontWeight.w700),
//                 ),
//         ),
//       ),
//     );
//   }
// }
