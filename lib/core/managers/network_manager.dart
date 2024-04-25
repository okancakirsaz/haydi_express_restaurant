import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class NetworkManager {
  NetworkManager() {
    fetchBaseUrl();
  }
  final Dio network = Dio();

  final String localHost = "http://localhost:3000";

  //TODO: Use base product url
  final String baseUrlProduct = "https://haydiexpress.api.com";

  fetchBaseUrl() {
    if (kDebugMode) {
      network.options.baseUrl = localHost;
    } else {
      network.options.baseUrl = localHost;
    }
    return network.options.baseUrl;
  }
}
