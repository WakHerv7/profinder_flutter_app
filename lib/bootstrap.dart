import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bootstrap({
  required FutureOr<Widget> Function() builder,
}) {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      LicenseRegistry.addLicense(() async* {
        final license = await rootBundle.loadString('google_fonts/OFL.txt');
        yield LicenseEntryWithLineBreaks(['google_fonts'], license);
      });

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]).then(
        (value) async {
          runApp(await builder.call());
        },
      );
    },
    (error, stack) {
      if (kDebugMode) {
        print(error);
      }
    },
  );
}
