import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

void openStringUrl({
  required String url,
}) async {
  final parse = Uri.parse(url);
  if (await canLaunchUrl(parse)) {
    await launchUrl(parse);
  } else {
    log('cant open $url');
  }
}
