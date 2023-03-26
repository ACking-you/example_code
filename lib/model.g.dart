// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// CrimsonGenerator
// **************************************************************************

extension ReadContent on Crimson {
  Content readContent() {
    String? detail;

    loop:
    while (true) {
      switch (iterObjectHash()) {
        case -1:
          break loop;
        case -6293979897783841292: // detail
          detail = readStringOrNull();
          break;
        default:
          skip();
          break;
      }
    }

    final obj = Content();
    obj.detail = detail;
    return obj;
  }

  List<Content> readContentList() {
    final list = <Content>[];
    while (iterArray()) {
      list.add(readContent());
    }
    return list;
  }

  List<Content?> readContentOrNullList() {
    final list = <Content?>[];
    while (iterArray()) {
      list.add(skipNull() ? null : readContent());
    }
    return list;
  }
}

extension WriteContent on CrimsonWriter {
  void writeContent(Content value) {
    writeObjectStart();
    writeObjectKeyRaw('detail');
    final detailVal = value.detail;
    if (detailVal == null) {
      writeNull();
    } else {
      writeString(detailVal);
    }
    writeObjectEnd();
  }

  void writeContentList(List<Content> list) {
    writeArrayStart();
    for (final value in list) {
      writeContent(value);
    }
    writeArrayEnd();
  }

  void writeContentOrNullList(List<Content?> list) {
    writeArrayStart();
    for (final value in list) {
      if (value == null) {
        writeNull();
      } else {
        writeContent(value);
      }
    }
    writeArrayEnd();
  }
}
