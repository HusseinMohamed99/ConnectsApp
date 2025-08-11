import 'package:connects_app/core/helpers/enum/enum.dart';
import 'package:connects_app/core/helpers/extensions/snack_bar_extension.dart';
import 'package:connects_app/core/helpers/logger/app_logs.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:url_launcher/url_launcher.dart';

/// Attempts to initiate a phone call after requesting phone permission.
/// Provides localized error messages and logs any failures.
Future<void> makePhoneCall(BuildContext context, String phoneNumber) async {
  final showSnackbar = context.showSnackBar;

  // Request phone permission
  final status = await Permission.phone.request();

  if (status.isGranted) {
    final uri = Uri(scheme: 'tel', path: phoneNumber);

    // Attempt to launch the phone dialer
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      AppLogs.log('Could not launch $uri', type: LogType.error);
      showSnackbar('Unable To Call');
    }
  } else {
    // Handle denied or permanently denied permissions
    showSnackbar('Call Permission Denied');
    if (status.isPermanentlyDenied) {
      await openAppSettings(); // Direct user to manually grant permission
    }
  }
}
