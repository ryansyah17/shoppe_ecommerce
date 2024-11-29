import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppe_ecommerce/infrastructure/theme/constant/colors.dart';

import '../extensions/extensions.dart';

TextStyle textBlack({required BuildContext context}) {
  return GoogleFonts.raleway(
    color: AppColors.black,
    fontSize: getActualY(
      y: 14,
      context: context,
    ),
  );
}

TextStyle textWhite({required BuildContext context}) {
  return GoogleFonts.raleway(
    color: AppColors.white,
    fontSize: getActualY(
      y: 14,
      context: context,
    ),
  );
}
