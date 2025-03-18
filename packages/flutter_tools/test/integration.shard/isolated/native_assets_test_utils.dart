// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

<<<<<<< HEAD
import 'dart:convert';
=======
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
import 'dart:io';

import 'package:file/file.dart';
import 'package:file_testing/file_testing.dart';
<<<<<<< HEAD
import 'package:yaml/yaml.dart';

import '../../src/common.dart';
import '../test_utils.dart' show ProcessResultMatcher, fileSystem, flutterBin;
import '../transition_test_utils.dart';

Future<Directory> createTestProject(String packageName, Directory tempDirectory) async {
  final ProcessResult result = processManager.runSync(<String>[
    flutterBin,
    'create',
    '--no-pub',
    '--template=package_ffi',
    packageName,
  ], workingDirectory: tempDirectory.path);
=======

import '../../src/common.dart';
import '../test_utils.dart' show ProcessResultMatcher, fileSystem;
import '../transition_test_utils.dart';

Future<Directory> createTestProject(String packageName, Directory tempDirectory) async {
  final ProcessResult result = processManager.runSync(
    <String>[
      flutterBin,
      'create',
      '--no-pub',
      '--template=package_ffi',
      packageName,
    ],
    workingDirectory: tempDirectory.path,
  );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
  if (result.exitCode != 0) {
    throw Exception(
      'flutter create failed: ${result.exitCode}\n${result.stderr}\n${result.stdout}',
    );
  }

  final Directory packageDirectory = tempDirectory.childDirectory(packageName);

  // No platform-specific boilerplate files.
  expect(packageDirectory.childDirectory('android'), isNot(exists));
  expect(packageDirectory.childDirectory('ios'), isNot(exists));
  expect(packageDirectory.childDirectory('linux'), isNot(exists));
  expect(packageDirectory.childDirectory('macos'), isNot(exists));
  expect(packageDirectory.childDirectory('windows'), isNot(exists));

  await pinDependencies(packageDirectory.childFile('pubspec.yaml'));
<<<<<<< HEAD
  await pinDependencies(packageDirectory.childDirectory('example').childFile('pubspec.yaml'));
=======
  await pinDependencies(
      packageDirectory.childDirectory('example').childFile('pubspec.yaml'));
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

  await addLinkHookDependency(packageName, packageDirectory);
  await addDynamicallyLinkedNativeLibrary(packageName, packageDirectory);

<<<<<<< HEAD
  final ProcessResult result2 = await processManager.run(<String>[
    flutterBin,
    'pub',
    'get',
  ], workingDirectory: packageDirectory.path);
=======
  final ProcessResult result2 = await processManager.run(
    <String>[
      flutterBin,
      'pub',
      'get',
    ],
    workingDirectory: packageDirectory.path,
  );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
  expect(result2, const ProcessResultMatcher());

  return packageDirectory;
}

Future<void> addLinkHookDependency(String packageName, Directory packageDirectory) async {
  final Directory flutterDirectory = fileSystem.currentDirectory.parent.parent;
  final Directory linkHookDirectory = flutterDirectory
      .childDirectory('dev')
      .childDirectory('integration_tests')
      .childDirectory('link_hook');
  expect(linkHookDirectory, exists);

<<<<<<< HEAD
  final File linkHookPubspecFile = linkHookDirectory.childFile('pubspec.yaml');
  final File thisPubspecFile = packageDirectory.childFile('pubspec.yaml');

  final Map<String, Object?> linkHookPubspec = _pubspecAsMutableJson(
    linkHookPubspecFile.readAsStringSync(),
  );
  final Map<String, Object?> linkHooksDependencies =
      linkHookPubspec['dependencies']! as Map<String, Object?>;
  final Map<String, Object?> linkHooksDevDependencies =
      linkHookPubspec['dev_dependencies']! as Map<String, Object?>;

  final Map<String, Object?> thisPubspec = _pubspecAsMutableJson(
    thisPubspecFile.readAsStringSync(),
  );

  final Map<String, Object?> thisDependencies =
      thisPubspec['dependencies']! as Map<String, Object?>;
  final Map<String, Object?> thisDevDependencies =
      thisPubspec['dev_dependencies']! as Map<String, Object?>;

  // Flutter CI uses pinned dependencies for all packages (including
  // dev/integration_tests/link_hook) for deterministic testing on CI.
  //
  // The ffi template that was generated with `flutter create` does not use
  // pinned dependencies.
  //
  // We ensure that the test package we generate here will have versions
  // compatible with the one from flutter CIs pinned dependencies.
  _updateDependencies(thisDependencies, linkHooksDependencies);
  _updateDependencies(thisDevDependencies, linkHooksDependencies);
  // Resolving dependencies for this package wouldn't normally use
  // the dev dependencies of the `link_hook` package. But there may be some
  // non-dev `link_hook` dependencies that affect resolution of dev
  // dependencies. So by making this compatible to `link_hook`s dev dependencies
  // we implicitly also make it compatible to `link_hook`s non-dev dependencies.
  //
  // Example: `link_hook` has `test_core` as dependency and `test` as dev
  // dependency. By using the same version of `test` in this package as
  // `link_hook` we implicitly are guaranteed to also get a version of
  // `test_core` that is compatible (and `test_core` is pinned in `link_hook`)
  _updateDependencies(thisDependencies, linkHooksDevDependencies);
  _updateDependencies(thisDevDependencies, linkHooksDevDependencies);
  thisDependencies['link_hook'] = <String, Object?>{'path': linkHookDirectory.path};

  await thisPubspecFile.writeAsString(json.encode(thisPubspec));

  final File dartFile = packageDirectory.childDirectory('lib').childFile('$packageName.dart');
  final String dartFileOld = (await dartFile.readAsString()).replaceAll('\r\n', '\n');
=======
  final File pubspecFile = packageDirectory.childFile('pubspec.yaml');
  final String pubspecOld =
      (await pubspecFile.readAsString()).replaceAll('\r\n', '\n');
  final String pubspecNew = pubspecOld.replaceFirst('''
dependencies:
''', '''
dependencies:
  link_hook:
    path: ${linkHookDirectory.path}
''');
  expect(pubspecNew, isNot(pubspecOld));
  await pubspecFile.writeAsString(pubspecNew);

  final File dartFile =
      packageDirectory.childDirectory('lib').childFile('$packageName.dart');
  final String dartFileOld =
      (await dartFile.readAsString()).replaceAll('\r\n', '\n');
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
  // Replace with something that results in the same resulting int, so that the
  // tests don't have to be updated.
  final String dartFileNew = dartFileOld.replaceFirst(
    '''
import '${packageName}_bindings_generated.dart' as bindings;
''',
    '''
import 'package:link_hook/link_hook.dart' as l;

import '${packageName}_bindings_generated.dart' as bindings;
''',
  );
  expect(dartFileNew, isNot(dartFileOld));
  final String dartFileNew2 = dartFileNew.replaceFirst(
    'int sum(int a, int b) => bindings.sum(a, b);',
    'int sum(int a, int b) => bindings.sum(a, b) + l.difference(2, 1) - 1;',
  );
  expect(dartFileNew2, isNot(dartFileNew));
  await dartFile.writeAsString(dartFileNew2);
}

<<<<<<< HEAD
Map<String, Object?> _pubspecAsMutableJson(String pubspecContent) {
  return json.decode(json.encode(loadYaml(pubspecContent))) as Map<String, Object?>;
}

void _updateDependencies(Map<String, Object?> to, Map<String, Object?> from) {
  for (final String packageName in to.keys) {
    to[packageName] = from[packageName] ?? to[packageName];
  }
}

/// Adds a native library to be built by the builder and dynamically link it to
/// the  main library.
Future<void> addDynamicallyLinkedNativeLibrary(
  String packageName,
  Directory packageDirectory,
) async {
=======
/// Adds a native library to be built by the builder and dynamically link it to
/// the  main library.
Future<void> addDynamicallyLinkedNativeLibrary(String packageName, Directory packageDirectory) async {
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
  // Add linked library source files.
  final Directory srcDirectory = packageDirectory.childDirectory('src');
  final File linkedLibraryHeaderFile = srcDirectory.childFile('add.h');
  await linkedLibraryHeaderFile.writeAsString('''
#include <stdint.h>

#if _WIN32
#define FFI_PLUGIN_EXPORT __declspec(dllexport)
#else
#define FFI_PLUGIN_EXPORT
#endif

FFI_PLUGIN_EXPORT intptr_t add(intptr_t a, intptr_t b);
<<<<<<< HEAD
''');
=======
'''
  );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
  final File linkedLibrarySourceFile = srcDirectory.childFile('add.c');
  await linkedLibrarySourceFile.writeAsString('''
#include "add.h"

FFI_PLUGIN_EXPORT intptr_t add(intptr_t a, intptr_t b) {
  return a + b;
}
''');

  // Update main library to include call to linked library.
  final File mainLibrarySourceFile = srcDirectory.childFile('$packageName.c');
  String mainLibrarySource = await mainLibrarySourceFile.readAsString();
<<<<<<< HEAD
  mainLibrarySource = mainLibrarySource.replaceFirst('#include "$packageName.h"', '''
#include "$packageName.h"
#include "add.h"
''');
=======
  mainLibrarySource = mainLibrarySource.replaceFirst(
    '#include "$packageName.h"',
'''
#include "$packageName.h"
#include "add.h"
''',
  );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
  mainLibrarySource = mainLibrarySource.replaceAll('a + b', 'add(a, b)');
  await mainLibrarySourceFile.writeAsString(mainLibrarySource);

  // Update builder to build the native library and link it into the main library.
  const String builderSource = r'''
<<<<<<< HEAD

import 'package:logging/logging.dart';
import 'package:native_assets_cli/code_assets.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';
=======
import 'package:native_toolchain_c/native_toolchain_c.dart';
import 'package:logging/logging.dart';
import 'package:native_assets_cli/native_assets_cli.dart';
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

void main(List<String> args) async {
  await build(args, (config, output) async {
    final packageName = config.packageName;

<<<<<<< HEAD
    if (!config.buildAssetTypes.contains(CodeAsset.type)) {
      return;
    }
=======
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
    final builders = [
      CBuilder.library(
        name: 'add',
        assetName: 'add',
        sources: ['src/add.c'],
      ),
      CBuilder.library(
        name: packageName,
        assetName: '${packageName}_bindings_generated.dart',
        sources: ['src/$packageName.c'],
        flags: config.dynamicLinkingFlags('add'),
      ),
    ];

    final logger = Logger('')
        ..level = Level.ALL
        ..onRecord.listen((record) => print(record.message));

    for (final builder in builders) {
      await builder.run(
        config: config,
        output: output,
        logger: logger,
      );
    }
  });
}

extension on BuildConfig {
<<<<<<< HEAD
  List<String> dynamicLinkingFlags(String libraryName) => switch (codeConfig.targetOS) {
=======
  List<String> dynamicLinkingFlags(String libraryName) => switch (targetOS) {
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
        OS.macOS || OS.iOS => [
            '-L${outputDirectory.toFilePath()}',
            '-l$libraryName',
          ],
        OS.linux || OS.android => [
            '-Wl,-rpath=\$ORIGIN/.',
            '-L${outputDirectory.toFilePath()}',
            '-l$libraryName',
          ],
        OS.windows => [
            outputDirectory.resolve('$libraryName.lib').toFilePath()
          ],
<<<<<<< HEAD
        _ => throw UnimplementedError('Unsupported OS: ${codeConfig.targetOS}'),
=======
        _ => throw UnimplementedError('Unsupported OS: $targetOS'),
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
      };
}
''';

  final Directory hookDirectory = packageDirectory.childDirectory('hook');
  final File builderFile = hookDirectory.childFile('build.dart');
  await builderFile.writeAsString(builderSource);
}

Future<void> pinDependencies(File pubspecFile) async {
  expect(pubspecFile, exists);
  final String oldPubspec = await pubspecFile.readAsString();
  final String newPubspec = oldPubspec.replaceAll(RegExp(r':\s*\^'), ': ');
  expect(newPubspec, isNot(oldPubspec));
  await pubspecFile.writeAsString(newPubspec);
}

<<<<<<< HEAD
Future<void> inTempDir(Future<void> Function(Directory tempDirectory) fun) async {
  final Directory tempDirectory = fileSystem.directory(
    fileSystem.systemTempDirectory.createTempSync().resolveSymbolicLinksSync(),
  );
=======

Future<void> inTempDir(Future<void> Function(Directory tempDirectory) fun) async {
  final Directory tempDirectory = fileSystem.directory(fileSystem.systemTempDirectory.createTempSync().resolveSymbolicLinksSync());
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
  try {
    await fun(tempDirectory);
  } finally {
    tryToDelete(tempDirectory);
  }
}
