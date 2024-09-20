import 'result.dart';

///This class provides operation result, operation message and also provides data.
///If you want to return data with success and message info same time than use this class.
///This class is generic type so you must set your data type. Your data must be an object.
///
///Simple example:
///
///```dart
///Future<DataResult<CityModel>> getCities(String countryCode) async{
///   final cities = await _service.getCities(countryCode);
///   return cities == null ? DataResult.error(message:'Data is null') : DataResult.success(data: cities);
///}
///```
class DataResult<TData> extends Result {
  ///Operation result data.
  final TData? data;

  bool get isSuccessAndDataExists => isSuccess && data != null;

  bool get isNotSuccessOrDataNotExists => !isSuccessAndDataExists;

  const DataResult({required super.isSuccess, required super.message, required this.data});

  ///When operation is success and also has data then use this.
  const DataResult.success({required this.data, super.message}) : super.success();

  ///When operation is success and also has data and message then use this.
  const DataResult.successByMessage({required this.data, required super.message}) : super.successByMessage();

  ///When operation is not success and also has data and message then use it.
  const DataResult.error({this.data, required super.message}) : super.error();

  ///When operation is not success and also has data and message is empty then use it.
  const DataResult.errorByEmpty({this.data}) : super.errorByEmpty();
}
