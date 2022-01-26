import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobx_calismasi/core/base/model/base_error.dart';
import 'package:mobx_calismasi/core/base/model/base_model.dart';
import 'package:mobx_calismasi/core/constants/enums/locale_keys_enum.dart';
import 'package:mobx_calismasi/core/init/cache/locale_manager.dart';
import 'package:mobx_calismasi/core/init/lang/locale_keys.g.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  late Dio _dio;

  NetworkManager._init() {
    final baseOption = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        headers: {
          "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
        });

    _dio = Dio(baseOption);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.path += 'gokhan';
          return handler.next(options);
        },
        // onResponse: (e, handler) {
        //   return handler.next(e.data);
        // },
        onError: (e, handler) {
          //
          BaseError(message: e.message);
          return handler.next(e);
        },
      ),
    );
  }

  Future dioGet<T extends Basemodel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;

        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody as Map<String, Object>); //
        }
        return responseBody;

      default:
    }
  }
}
