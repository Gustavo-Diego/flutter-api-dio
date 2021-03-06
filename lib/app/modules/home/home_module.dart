import 'package:dio/dio.dart';
import 'package:teste/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/modules/home/home_page.dart';
import 'package:teste/app/services/home_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<HomeRepository>())),
        Bind((i) => HomeRepository(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
