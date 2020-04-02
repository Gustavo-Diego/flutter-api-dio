import 'package:mobx/mobx.dart';
import 'package:teste/app/modules/home/home_status.dart';
import 'package:teste/app/services/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;
  
  _HomeControllerBase(this.repository){
    fetchPosts();
  }

  @observable
  HomeStatus status = HomeStatus.none;

  @action
  Future<void> fetchPosts() async {
    status = HomeStatus.loading;

    try{
      final response = await repository.fetchPosts();
      status = HomeStatus.success..value = response;
    } catch (error) {
      status = HomeStatus.error..value = error;
    }

  }

}
