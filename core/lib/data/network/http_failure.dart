import 'package:core/data/network/error_handler.dart';

class HttpFailure {
  int code;
  String message;
  DataSource dataSource;

  HttpFailure(this.code, this.message, this.dataSource);
}
