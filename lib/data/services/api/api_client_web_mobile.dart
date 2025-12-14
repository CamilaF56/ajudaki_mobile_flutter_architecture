import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ajudaki_mobile_flutter_architecture/core/logger.dart';

class ApiClientWebMobile {
  ApiClientWebMobile._privateConstructor();
  static final ApiClientWebMobile instance = ApiClientWebMobile._privateConstructor();

  final String host = 'localhost';
  final int port = 5299;
  final Duration timeout = const Duration(seconds: 5);

  Future<Map<String, dynamic>> get(String path) async {
    int statusCode = 0;
    String? responseBody;

    try {
      if (kIsWeb) {
        final uri = Uri.http('$host:$port', path);
        final response = await http.get(uri).timeout(timeout);
        statusCode = response.statusCode;
        responseBody = response.body;
      }
      else {
        final client = HttpClient();
        try {
          final request = await client.get(host, port, path).timeout(timeout);
          final response = await request.close().timeout(timeout);
          statusCode = response.statusCode;
          responseBody = await response.transform(utf8.decoder).join();
        } finally {
          client.close();
        }
      }
    } catch (e) {
      statusCode = 0;
      responseBody = null;
      Logger.instance.info('ApiClientWebMobile $path error $e');
    }

    return {
      'statusCode': statusCode,
      'body': responseBody,
    };
  }
}