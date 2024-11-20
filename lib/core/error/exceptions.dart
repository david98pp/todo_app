// ignore_for_file: implementation_imports

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/src/response.dart';

class ServerException implements Exception {
  final Response? response;

  ServerException(this.response) {
    if (response != null) {
      var error = json.decode(response!.body);
      debugPrintStack(label: error['status']);
      debugPrintStack(label: error['code']);
      debugPrintStack(label: error['message']);
    } else {
      debugPrintStack(label: 'Revisa todo, algo esta mal');
    }
  }
}
