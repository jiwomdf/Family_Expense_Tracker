extension StringExtension on String {
  String ifEmpty(String defaultValue) {
    return isNotEmpty ? this : defaultValue;
  }

  int fromRupiah() {
    String str = replaceAll(",", "").trim();
    return int.tryParse(str) ?? 0;
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
