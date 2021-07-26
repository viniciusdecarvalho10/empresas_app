import 'dart:convert';

import 'package:dio/dio.dart';

class AuthModel {
  final String apiToken;
  final String client;
  final String uid;
  final String name;
  final String email;
  final String password;
  final String? messageError;
  final bool islogged;

  AuthModel({
    this.apiToken = '',
    this.client = '',
    this.uid = '',
    this.name = '',
    this.email = '',
    this.password = '',
    this.messageError,
    this.islogged = false,
  });

  AuthModel copyWith({
    String? apiToken,
    String? client,
    String? uid,
    String? name,
    String? email,
    String? password,
    String? messageError,
    bool? islogged,
  }) {
    return AuthModel(
      apiToken: apiToken ?? this.apiToken,
      client: client ?? this.client,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      messageError: messageError ?? this.messageError,
      islogged: islogged ?? this.islogged,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'apiToken': apiToken,
      'client': client,
      'uid': uid,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(name: map['investor']['investor_name']);
  }

  factory AuthModel.fromHeader(Headers headers) {
    return AuthModel(
      apiToken: headers['access-token']![0],
      client: headers['client']![0],
      uid: headers['uid']![0],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(json.decode(source));

  @override
  String toString() => 'AuthModel(apiToken: $apiToken, client: $client, uid: $uid)';
}
