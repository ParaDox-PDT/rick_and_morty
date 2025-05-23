import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rick_and_morty/src/config/themes/app_typography.dart';
import 'package:rick_and_morty/src/config/themes/themes.dart';
import 'package:rick_and_morty/src/core/extension/extension.dart';

Future<void> showNetworkErrorToast({required BuildContext context}) async {
  FToast()
    ..init(context)
    ..showToast(
        child: customToast(
          color: context.colorScheme.secondary,
          isConnectError: true,
          message: 'No internet connection',
        ),
        gravity: ToastGravity.TOP);
}

Widget customToast(
        {required String message,
        required Color color,
        bool isConnectError = false}) =>
    DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isConnectError ? colorLightScheme.onSurface : color,
          border: Border.all(
              color: isConnectError
                  ? colorLightScheme.onSurface
                  : Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isConnectError
                ? SvgPicture.asset(AppIcons.backArrow)
                : Icon(
                    Icons.check,
                    color: colorLightScheme.onSurface,
                  ),
            12.g,
            Expanded(
              child: Text(
                message,
                style: AppTypography.st2Regular.copyWith(
                    color: isConnectError
                        ? colorLightScheme.secondary
                        : colorLightScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
