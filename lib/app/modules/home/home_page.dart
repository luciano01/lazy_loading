import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lazy_loading/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        store.getMoreUsers();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lazy Loading - MobX'),
        ),
        body: Observer(
          builder: (_) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: store.users.value!.length + 1,
              itemBuilder: (context, index) {
                if (index == store.users.value!.length) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        store.users.value![index].picture!.thumbnail!,
                      ),
                    ),
                    title: Text(store.users.value![index].name!.first!),
                    subtitle: Text(store.users.value![index].name!.last!),
                  );
                }
              },
            );
          },
        ));
  }
}
