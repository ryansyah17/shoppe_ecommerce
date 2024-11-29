import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shoppe_ecommerce/infrastructure/theme/constant/colors.dart';
import 'package:shoppe_ecommerce/infrastructure/theme/constant/const_text.dart';
import 'package:url_launcher/url_launcher.dart';

double defaultMargin = 24;
double designHeightPhone = 844;
double designWidthPhone = 390;

double getActualX({
  required double x,
  required BuildContext context,
}) {
  return x / designWidthPhone * MediaQuery.of(context).size.width;
}

double getActualY({
  required double y,
  required BuildContext context,
}) {
  return y / designHeightPhone * MediaQuery.of(context).size.height;
}

double getLineHeight({required double fontSize, required double lineHight}) {
  return lineHight / fontSize;
}

BoxShadow defaultBoxShadow = BoxShadow(
  blurRadius: 5,
  spreadRadius: 3,
  color: AppColors.greyColor,
);

SizedBox getSizedBox({
  required double size,
  required BuildContext context,
}) {
  return SizedBox(
    height: getActualY(y: size, context: context),
  );
}

SizedBox getWidthBox({
  required double size,
  required BuildContext context,
}) {
  return SizedBox(
    width: getActualX(x: size, context: context),
  );
}

Text getTextTitle({required BuildContext context, required String title}) {
  return Text(
    title,
    style: textBlack(context: context).copyWith(
      color: AppColors.primary,
      fontSize: getActualY(y: 18, context: context),
      fontWeight: FontWeight.bold,
    ),
  );
}

Future<void> openUrl(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  await launch(url,
      forceSafariVC: forceWebView, enableJavaScript: enableJavaScript);
}

void showLoading() {
  Get.dialog(
    Center(
      child: SpinKitCircle(
        color: AppColors.primary,
      ),
    ),
    barrierDismissible: false,
  );
}

void hideLoading() {
  Get.back();
}

void showSnackbar({
  required String title,
  required String deskripsi,
  required Color color,
}) {
  Get.snackbar(
    title,
    deskripsi,
    colorText: Colors.white,
    backgroundColor: color,
    icon: const Icon(Icons.warning, color: Colors.white),
    snackPosition: SnackPosition.TOP,
  );
}

String removeHtmlTags(String htmlString) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  return htmlString.replaceAll(exp, '');
}

CachedNetworkImage imageNetwork(String image) {
  return CachedNetworkImage(
    imageUrl: image,
    fit: BoxFit.cover,
    placeholder: (context, url) => SpinKitCircle(
      color: AppColors.primary,
    ),
    errorWidget: (context, url, error) =>
        Image.asset('assets/not-available.jpg'),
  );
}

Widget loadingShow(BuildContext context) {
  return Center(
    child: SpinKitCircle(
      color: AppColors.primary,
    ),
  );
}

Widget noData(
  double height,
  BuildContext context,
) {
  return SingleChildScrollView(
    child: SizedBox(
      width: double.infinity,
      height: getActualY(y: height, context: context),
      child: Image.asset('assets/images/no-data.png'),
    ),
  );
}
