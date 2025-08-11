import 'package:url_launcher/url_launcher.dart';

Future<void> openMailTo(String email) async {
  final uri = Uri(scheme: 'mailto', path: email);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
