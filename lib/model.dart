import 'dart:convert';

import 'package:crimson/crimson.dart';
part 'model.g.dart';

@json
class Content {
  String? detail;
  Content({this.detail});

  String toBase64() {
    if (detail == null) return "";
    return base64.encode(utf8.encode(detail!));
  }

  static Content fromBase64(String detail) {
    final content = Content();
    content.detail = utf8.decode(base64.decode(detail));
    return content;
  }
}
