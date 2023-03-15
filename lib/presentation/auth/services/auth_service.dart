import 'dart:convert';

import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/presentation/resources/errors_handling.dart';
import 'package:amazon_clone/presentation/resources/strings.dart';
import 'package:amazon_clone/presentation/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String emaill,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(id:'', 
      name: name, 
      email: email, 
      password:password,
      address: '',
      token:  '', 
      type: '',
      cart: ['']);

      // Send create accout informations to the server
      http.Response response = await http.post(
        Uri.parse(AppStrings.signUpUri),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, AppStrings.accountCreated);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      // Send login informations to the server
      http.Response response = await http.post(
        Uri.parse(AppStrings.signInUri),
        body: jsonEncode({
          'email': email,
          'password0': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
                Provider.of<UserProvid>
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
