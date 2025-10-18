import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';

class Helpers {
  Helpers._();

  /// Calculates and formats the time elapsed since a given DateTime.
  static String getTimeDifference(DateTime startDate) {
    Duration difference = DateTime.now().difference(startDate);
    String timeDifference = '';
    if (difference.inDays > 0) {
      timeDifference = '${difference.inDays}DAYS AGO';
    } else if (difference.inHours > 0) {
      timeDifference = '${difference.inHours}HR AGO';
    } else if (difference.inMinutes > 0) {
      timeDifference = '${difference.inMinutes}MIN AGO';
    } else if (difference.inSeconds > 0) {
      timeDifference = '${difference.inSeconds}SEC AGO';
    }
    return timeDifference;
  }

  /// Converts a Duration object into a human-readable string (e.g., "1d 2h 3m 4s").
  static String formatDuration(Duration d) {
    final days = d.inDays;
    final hours = d.inHours % 24;
    final minutes = d.inMinutes % 60;
    final seconds = d.inSeconds % 60;
    return "${days}d ${hours}h ${minutes}m ${seconds}s";
  }

  /// Formats a DateTime object into a string like "Oct 26, 2023".
  static String formatDate(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }

  /// Formats a DateTime object into a 24-hour time string like "14:30".
  static String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  /// Opens a given URL in an external application (e.g., a web browser).
  static Future<void> launchExternalUrl(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      Log.debug("Could not launch $url");
    }
  }

  /// Dismisses the on-screen keyboard for the current context.
  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// Copies the given string to the system clipboard.
  static void copyToClipBoard({required String text}) {
    Clipboard.setData(ClipboardData(text: text));
  }

  /// Launches the default phone app with the given phone number.
  static Future<void> launchPhone(String phone) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  /// Launches the default email app to compose an email to the given address.
  static Future<void> launchEmail(String email) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}
