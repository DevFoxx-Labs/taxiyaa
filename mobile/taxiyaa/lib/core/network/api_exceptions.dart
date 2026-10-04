class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic details;

  const ApiException(this.message, {this.statusCode, this.details});

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';
}

class NetworkException extends ApiException {
  const NetworkException([super.message = 'Unable to connect to Taxiyaa servers. Please check your internet connection.'])
      : super(statusCode: null);
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException([super.message = 'Session expired. Please log in again.'])
      : super(statusCode: 401);
}

class ForbiddenException extends ApiException {
  const ForbiddenException([super.message = 'You do not have permission to perform this action.'])
      : super(statusCode: 403);
}

class NotFoundException extends ApiException {
  const NotFoundException([super.message = 'Requested resource not found.'])
      : super(statusCode: 404);
}

class ServerException extends ApiException {
  const ServerException([super.message = 'Server encountered an error. Please try again later.'])
      : super(statusCode: 500);
}

class CacheException extends ApiException {
  const CacheException([super.message = 'Failed to load cached data.'])
      : super(statusCode: null);
}

