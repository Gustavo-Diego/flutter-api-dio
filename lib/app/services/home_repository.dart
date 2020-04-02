import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/shared/models/empresa_model.dart';

class HomeRepository extends Disposable {
  final Dio _client;
  HomeRepository(this._client);

  Future fetchPosts() async {
    //https://jsonplaceholder.typicode.com/posts para api externa, http://192.168.100.117 para api interna pq se usar localhost o flutter se confunde então se usa o ip da maquina
    final response = await _client.get('http://192.168.100.117:3003/buscarEmpresas');
    return (response.data as List).map((e) => Empresa.fromJson(e)).toList();
  }

  @override
  void dispose(){}
}