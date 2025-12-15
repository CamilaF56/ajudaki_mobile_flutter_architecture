import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ajudaki_mobile_flutter_architecture/core/logger.dart';
import 'api_client.dart';

class ApiClientWebMobile{
    static Future<Map<String, dynamic>> get(String path) async {
    int statusCode = 0;
    String? responseBody;

    try {
      if (kIsWeb) {
        final uri = Uri.http('${ApiClient.host}:${ApiClient.port}', path);
        final response = await http.get(uri).timeout(ApiClient.timeout);
        statusCode = response.statusCode;
        responseBody = response.body;
      }
      else {
        final client = HttpClient();
        try {
          final request = await client
          .get(ApiClient.host, ApiClient.port, path);
          final response = await request.close().timeout(ApiClient.timeout);
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