import 'package:flutter/services.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pixel_adventure/pixel_adventure.dart';
import 'components/Login.dart';
import 'components/Register.dart';

class PixelAdventureWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GameWidget(
          game: PixelAdventure(),
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  // Menetapkan preferensi orientasi landscape saja
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(PixelAdventureApp());
}

class PixelAdventureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pixel Adventure',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => PixelAdventureWrapper()), // Rute ke permainan setelah login berhasil
        GetPage(name: '/register', page: () => RegisterPage()),
      ],
    );
  }
}
