import 'package:cosquinrockflutter/src/pages/principal_page.dart';
import 'package:cosquinrockflutter/src/providers/grupos_provider.dart';
import 'package:cosquinrockflutter/src/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initNotifications();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //builder: ,
      create: (context) => ProviderGrupos(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Inter',
          //primarySwatch: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => PrincipalPage(),
        },
      ),
    );
  }
}
