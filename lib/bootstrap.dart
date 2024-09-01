import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

      await Supabase.initialize(
        url: 'https://mgjussnydrdneclpvaso.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1nanVzc255ZHJkbmVjbHB2YXNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUxOTM4MjgsImV4cCI6MjA0MDc2OTgyOH0.URDiBUN3K99-ttq1yfk_IyHSvuaZud3ogyu7LVLSaOo',
      );

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
