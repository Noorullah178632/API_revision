class AppExceptions implements Exception {
  final _message;
  final _preffix;
  AppExceptions([this._message, this._preffix]);
  //override a method
  @override
  String toString() {
    return "$_message $_preffix";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
    : super(message, "Error During Communication");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, "Invalid input");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
    : super(message, "Authorized Request");
}
