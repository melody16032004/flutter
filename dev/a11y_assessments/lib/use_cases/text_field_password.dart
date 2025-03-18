// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import '../utils.dart';
import 'use_cases.dart';

class TextFieldPasswordUseCase extends UseCase {
  @override
  String get name => 'TextField password';

  @override
  String get route => '/text-field-password';

  @override
  Widget build(BuildContext context) => _MainWidget();
}

class _MainWidget extends StatelessWidget {
  _MainWidget();

  final String pageTitle = getUseCaseName(TextFieldPasswordUseCase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Semantics(headingLevel: 1, child: Text('$pageTitle Demo')),
      ),
      body: ListView(
        children: const <Widget>[
          TextField(
            key: Key('enabled password'),
<<<<<<< HEAD
            decoration: InputDecoration(labelText: 'Password'),
=======
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
            obscureText: true,
          ),
          TextField(
            key: Key('disabled password'),
<<<<<<< HEAD
            decoration: InputDecoration(labelText: 'Password'),
=======
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
            enabled: false,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
