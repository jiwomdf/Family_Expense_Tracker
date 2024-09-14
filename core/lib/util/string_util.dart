extension StringExtension on String {
  String toInputFormat() {
    if (isEmpty) {
      return "undefined";
    } else {
      return trim().toLowerCase();
    }
  }

  String addZeroPref() {
    var strLength = toString().length;
    if (strLength < 2) {
      return "0$this";
    } else {
      return this;
    }
  }
}

extension DynamicExtension on dynamic {
  String toInputFormat() {
    if (this == null) {
      return "undefined";
    } else {
      return toString().trim().toLowerCase();
    }
  }
}
