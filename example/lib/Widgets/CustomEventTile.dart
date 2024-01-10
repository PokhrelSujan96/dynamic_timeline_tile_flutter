import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomEventTile extends StatelessWidget {
  final String title;
  final String description;
  final Color? textColor;
  final Color? imageColor;
  final Color? iconColor;

  final IconData? icon;
  const CustomEventTile(
      {super.key,
      required this.title,
      required this.description,
      this.textColor,
      this.icon,
      this.imageColor, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.mulish(
                color: textColor ?? Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              icon ?? Icons.event,
              size: 17.sp,
              color: iconColor ?? Colors.black,
            )
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: imageColor ?? Colors.blue),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          description,
          style: GoogleFonts.mulish(
            color: textColor ?? Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}



class CustomEventTile2 extends StatelessWidget {
  final String title;
  final String description;
  final Color? textColor;
  final Color? imageColor;
  final Color? iconColor;

  final IconData? icon;
  const CustomEventTile2(
      {super.key,
      required this.title,
      required this.description,
      this.textColor,
      this.icon,
      this.imageColor, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.mulish(
                color: textColor ?? Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              icon ?? Icons.event,
              size: 17.sp,
              color: iconColor ?? Colors.black,
            )
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          description,
          style: GoogleFonts.mulish(
            color: textColor ?? Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
