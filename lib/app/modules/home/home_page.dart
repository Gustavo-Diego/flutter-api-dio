import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/modules/home/home_status.dart';
import 'package:teste/app/shared/models/empresa_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if( controller.status == HomeStatus.loading ){
          return Center(
            child: CircularProgressIndicator()
          );
        } else if (controller.status == HomeStatus.success){
          final list = controller.status.value as List<Empresa>;
          if(list.isNotEmpty){
            return 
            ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(list[index].nome),
              )
            );
          }else{
            Text("lista vazia");
          }
        } else if (controller.status == HomeStatus.error){
          return Text("${controller.status.value}");
        }
      }
      )
    );
  }
}
