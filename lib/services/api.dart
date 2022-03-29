import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../constants/constants.dart';
import '../models/product.dart';

part 'api.g.dart';

@RestApi(baseUrl: URL)
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET('/products')
  Future<List<Product>> getProducts();
}

