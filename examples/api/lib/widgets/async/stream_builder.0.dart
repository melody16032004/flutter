// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';

/// Flutter code sample for [StreamBuilder].

void main() => runApp(const StreamBuilderExampleApp());

class StreamBuilderExampleApp extends StatelessWidget {
  const StreamBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const MaterialApp(home: StreamBuilderExample(delay: delay));
=======
    return const MaterialApp(
      home: StreamBuilderExample(),
    );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
  }
}

class StreamBuilderExample extends StatefulWidget {
<<<<<<< HEAD
  const StreamBuilderExample({required this.delay, super.key});

  final Duration delay;
=======
  const StreamBuilderExample({super.key});
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  final Stream<int> _bids = (() {
    late final StreamController<int> controller;
    controller = StreamController<int>(
      onListen: () async {
        await Future<void>.delayed(const Duration(seconds: 1));
        controller.add(1);
        await Future<void>.delayed(const Duration(seconds: 1));
        await controller.close();
      },
    );
    return controller.stream;
  })();

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: Container(
        alignment: FractionalOffset.center,
        color: Colors.white,
        child: StreamBuilder<int>(
          stream: _bids,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            List<Widget> children;
            if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('Stack trace: ${snapshot.stackTrace}'),
                ),
              ];
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  children = const <Widget>[
                    Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Select a lot'),
                    ),
                  ];
                case ConnectionState.waiting:
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting bids...'),
                    ),
                  ];
                case ConnectionState.active:
                  children = <Widget>[
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('\$${snapshot.data}'),
                    ),
                  ];
                case ConnectionState.done:
                  children = <Widget>[
                    const Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('\$${snapshot.data} (closed)'),
                    ),
                  ];
              }
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            );
          },
        ),
      ),
    );
  }
}
<<<<<<< HEAD

class BidsStatus extends StatelessWidget {
  const BidsStatus({required this.bids, super.key});

  final Stream<int>? bids;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bids,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        List<Widget> children;
        if (snapshot.hasError) {
          children = <Widget>[
            const Icon(Icons.error_outline, color: Colors.red, size: 60),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Stack trace: ${snapshot.stackTrace}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ];
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              children = const <Widget>[
                Icon(Icons.info, color: Colors.blue, size: 60),
                Padding(padding: EdgeInsets.only(top: 16), child: Text('Select a lot')),
              ];
            case ConnectionState.waiting:
              children = const <Widget>[
                SizedBox(width: 60, height: 60, child: CircularProgressIndicator()),
                Padding(padding: EdgeInsets.only(top: 16), child: Text('Awaiting bids...')),
              ];
            case ConnectionState.active:
              children = <Widget>[
                const Icon(Icons.check_circle_outline, color: Colors.green, size: 60),
                Padding(padding: const EdgeInsets.only(top: 16), child: Text('\$${snapshot.data}')),
              ];
            case ConnectionState.done:
              children = <Widget>[
                const Icon(Icons.info, color: Colors.blue, size: 60),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(snapshot.hasData ? '\$${snapshot.data} (closed)' : '(closed)'),
                ),
              ];
          }
        }

        return Column(mainAxisAlignment: MainAxisAlignment.center, children: children);
      },
    );
  }
}
=======
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
