///Simple result class that includes operation status [success] and operation message [message].
///It's useful for returning operation result and message together.
///
///Simple example:
///
///```dart
///Future<Result> validateUser(UserModel user) async {
///   final isValid = await _service.validate(user);
///   return isValid ? Result.success() : Result.error(message: 'User is not valid!');
///}
///```
class Result {
  const Result({required this.isSuccess, this.message = ''});

  ///It automatically returns success true. Message's default value is empty.
  const Result.success({this.message = ''}) : isSuccess = true;

  ///It automatically returns success true. Message is required.
  const Result.successByMessage({required this.message}) : isSuccess = true;

  ///It automatically returns error. Message's default value is empty.
  const Result.error({required this.message}) : isSuccess = false;

  ///It automatically returns error. Message is required.
  const Result.errorByEmpty({this.message = ''}) : isSuccess = false;

  bool get isNotSuccess => !isSuccess;

  ///Operation result.
  final bool isSuccess;

  ///Operation message.
  final String message;
}
