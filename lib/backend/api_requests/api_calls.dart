import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TapCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
  "amount": 1,
  "currency": "KWD",
  "threeDSecure": true,
  "save_card": false,
  "description": "Test Description",
  "statement_descriptor": "Sample",
  "metadata": {
    "udf1": "test 1",
    "udf2": "test 2"
  },
  "reference": {
    "transaction": "txn_0001",
    "order": "ord_0001"
  },
  "receipt": {
    "email": false,
    "sms": true
  },
  "customer": {
    "first_name": "test",
    "middle_name": "test",
    "last_name": "test",
    "email": "test@test.com",
    "phone": {
      "country_code": "965",
      "number": "50000000"
    }
  },
  "merchant": {
    "id": ""
  },
  "source": {
    "id": "src_kw.knet"
  },
  "post": {
    "url":"demo://demo.com/orderok"
  },
  "redirect": {
    "url": "https://hook.eu1.make.com/9frkhz7xfamprx5t6vrgemjo2piv4jlv"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tap',
      apiUrl: 'https://api.tap.company/v2/charges',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer sk_test_EP10TWZp824MexnL7lOawBgU',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic urltoopen(dynamic response) => getJsonField(
        response,
        r'''$.transaction.url''',
      );
}

class ViewAllChargesCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
  "period": {
    "date": {
      "from": 1675215968,
      "to": 1675561568
    },
    "type": 1
  },
  "status": "",
  "starting_after": "",
  "limit": 25
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'view all charges',
      apiUrl: 'https://api.tap.company/v2/charges/list',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer sk_test_EP10TWZp824MexnL7lOawBgU',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RevtriveAChargeFromIdCall {
  static Future<ApiCallResponse> call({
    String? charge = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'revtrive a charge from id',
      apiUrl: 'https://api.tap.company/v2/charges/${charge}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer sk_test_EP10TWZp824MexnL7lOawBgU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
