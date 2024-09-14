import 'dart:ui';

class AppColors {
  static final orange = _Orange();
  static final white = _White();
  static final blue = _Blue();
  static final black = _Black();
  static final grey = _Grey();
  static final green = _Green();
  static final red = _Red();
  static final yellow = _Yellow();
  static final purple = _Purple();
  static final pink = _Pink();
}

class _Black {
  final Color primary = const Color(0xFF1E1E1E);
  final Color text = const Color(0xFF000000);
}

class _Blue {
  final Color bgLightBlue = const Color.fromARGB(255, 230, 241, 255);
  final Color lightBlue = const Color(0xFFC1DCFF);
  final Color oceanBlue = const Color(0xFF1F57A0);
  final Color cloudBlue = const Color(0xFF5996E4);
  final Color warmBlue = const Color(0xFF5996E4);
  final Color borderBlue = const Color.fromRGBO(238, 246, 255, 1);
  final Color cardVideoBlue = const Color(0xFF289FD0);
  final Color cardVideoLightBlue = const Color(0xFF5ACFFF);
  final Color cardVideoGradienBlue = const Color(0xFF71CAEF);
  final Color primary = const Color(0xFF2972E0);
  final Color textBlue = const Color(0xFF38bdf8);
  final Color bgCardDarkBlue = const Color.fromARGB(255, 20, 32, 59);
  final Color bgDarkBlue = const Color.fromARGB(255, 15, 24, 44);
}

class _Grey {
  final Color primary = const Color(0xFF707070);
  final Color veryLightGrey = const Color(0xFFFAFAFA);
  final Color lightGray = const Color(0xFF8C8C8C);
  final Color systemDisable = const Color(0xFFBFBFBF);
  final Color naturalGray = const Color(0xFFBFBFBF);
  final Color whiteSmoke = const Color(0xFFE8E8E8);
  final Color naturalGray300 = const Color(0xFFE8E8E8);
  final Color naturalGray600 = const Color(0xFF8C8C8C);
  final Color textGray = const Color(0xFF7C7C7C);
  final Color textButton = const Color(0xFF595959);
  final Color outlineButton = const Color(0xFFD9D9D9);
}

class _Green {
  final Color primary = const Color(0xFF00A86B);
  final Color lightGreen = const Color(0xFFD4FFE0);
}

class _Orange {
  final Color primary = const Color(0xFFE64325);
  final Color lightOrange = const Color(0xFFF5882E);
  final Color textOrange = const Color(0xFFEB6951);
  final Color lightOrangeText = const Color(0xFFF78927);
  final Color lightOrangeText300 = const Color(0xFFF4BB48);
  final Color orangeGradienVidio = const Color(0xFFF78927);
}

class _Pink {
  final Color primary = const Color(0xFFF2687F);
  final Color pinkLace = const Color(0xFFFFF5F7);
}

class _Purple {
  final Color bgLightPurple = const Color(0xFFfaf8ff);
  final Color purpleSoftLight = const Color(0xFFf4f3fa);
  final Color purpleGradienVideo = const Color(0xFFB25C8C);
  final Color purpleDarkPrimary = const Color.fromARGB(255, 37, 19, 84);
  final Color purplePrimary = const Color(0xFF4f378b);
  final Color purpleDarker = const Color(0xFF1b1b23);
}

class _Red {
  final Color primary = const Color(0xFFE53935);
  final Color redCountDownText = const Color(0xFFBF2600);
  final Color lightRed = const Color(0xFFFFF5F0);
}

class _White {
  final Color primary = const Color(0xFFFFFFFF);
}

class _Yellow {
  final Color yellow500 = const Color(0xFFF2687F);
}
