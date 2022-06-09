import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teta_cms/src/models/response.dart';
import 'package:teta_cms/src/store/products.dart';
import 'package:teta_cms/src/utils.dart';

class TetaStore {
  TetaStore(
    this.token,
    this.prjId,
  ) {
    products = TetaStoreProducts(token, prjId);
  }

  final String token;
  final int prjId;

  late final TetaStoreProducts products;

  Map<String, String> get headers => <String, String>{
        'authorization': 'Bearer $token',
        'x-teta-prj-id': '$prjId',
      };

  /// Gets all the store's transactions
  Future<TetaResponse> transactions(final String userToken) async {
    final uri = Uri.parse(
      '${U.storeUrl}transactions',
    );

    final res = await http.get(
      uri,
      headers: {
        ...headers,
        'content-type': 'application/json',
      },
    );

    if (res.statusCode != 200) {
      return TetaResponse(
        error: TetaErrorResponse(
          code: res.statusCode,
          message: res.body,
        ),
      );
    }

    return TetaResponse(
      data: json.decode(res.body),
    );
  }

  /// Delete a store
  Future<TetaResponse> delete() async {
    final uri = Uri.parse(
      U.storeUrl,
    );

    final res = await http.delete(
      uri,
      headers: {
        ...headers,
        'content-type': 'application/json',
      },
    );

    if (res.statusCode != 200) {
      return TetaResponse(
        error: TetaErrorResponse(
          code: res.statusCode,
          message: res.body,
        ),
      );
    }

    return TetaResponse(data: json.encode(res.body));
  }

  Future<TetaResponse> setCurrency(final String currency) async {
    final uri = Uri.parse(
      '${U.storeUrl}currency/$currency',
    );

    final res = await http.put(
      uri,
      headers: {
        ...headers,
        'content-type': 'application/json',
      },
    );

    if (res.statusCode != 200) {
      return TetaResponse(
        error: TetaErrorResponse(
          code: res.statusCode,
          message: res.body,
        ),
      );
    }

    return TetaResponse(data: json.encode(res.body));
  }
}
