// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Flutter code sample for [TabController].

void main() => runApp(const TabControllerExampleApp());

class TabControllerExampleApp extends StatelessWidget {
  const TabControllerExampleApp({super.key});

<<<<<<< HEAD
  static const List<Tab> tabs = <Tab>[Tab(text: 'Zeroth'), Tab(text: 'First'), Tab(text: 'Second')];

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TabControllerExample(tabs: tabs));
  }
}

class TabControllerExample extends StatelessWidget {
  const TabControllerExample({required this.tabs, super.key});
=======
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TabControllerExample(),
    );
  }
}

const List<Tab> tabs = <Tab>[
  Tab(text: 'Zeroth'),
  Tab(text: 'First'),
  Tab(text: 'Second'),
];
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

class TabControllerExample extends StatelessWidget {
  const TabControllerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
<<<<<<< HEAD
      child: DefaultTabControllerListener(
        onTabChanged: (int index) {
          debugPrint('tab changed: $index');
        },
        child: Scaffold(
          appBar: AppBar(bottom: TabBar(tabs: tabs)),
=======
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
          body: TabBarView(
            children:
                tabs.map((Tab tab) {
                  return Center(
                    child: Text(
                      '${tab.text!} Tab',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  );
                }).toList(),
          ),
        );
      }),
    );
  }
}
<<<<<<< HEAD

class DefaultTabControllerListener extends StatefulWidget {
  const DefaultTabControllerListener({required this.onTabChanged, required this.child, super.key});

  final ValueChanged<int> onTabChanged;

  final Widget child;

  @override
  State<DefaultTabControllerListener> createState() => _DefaultTabControllerListenerState();
}

class _DefaultTabControllerListenerState extends State<DefaultTabControllerListener> {
  TabController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final TabController? defaultTabController = DefaultTabController.maybeOf(context);

    assert(() {
      if (defaultTabController == null) {
        throw FlutterError(
          'No DefaultTabController for ${widget.runtimeType}.\n'
          'When creating a ${widget.runtimeType}, you must ensure that there '
          'is a DefaultTabController above the ${widget.runtimeType}.',
        );
      }
      return true;
    }());

    if (defaultTabController != _controller) {
      _controller?.removeListener(_listener);
      _controller = defaultTabController;
      _controller?.addListener(_listener);
    }
  }

  void _listener() {
    final TabController? controller = _controller;

    if (controller == null || controller.indexIsChanging) {
      return;
    }

    widget.onTabChanged(controller.index);
  }

  @override
  void dispose() {
    _controller?.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
=======
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
