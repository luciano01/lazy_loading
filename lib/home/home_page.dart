import 'package:flutter/material.dart';
import 'package:lazy_loading/bloc/home_bloc.dart';
import 'package:lazy_loading/models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _bloc = HomeBloc();

  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _bloc.getMoreUsers();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Loading - BLoC'),
      ),
      body: StreamBuilder<List<User>>(
        stream: _bloc.outListOfUsers,
        builder: (context, snapshot) {
          List<User>? listOfUsers = snapshot.data;
          int itemCount = listOfUsers?.length ?? 0;
          var error = snapshot.error;
          bool hasData = snapshot.hasData;
          if (error != null) {
            return const Center(child: Text('Error!'));
          }
          if (hasData) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                User user = listOfUsers![index];
                if (index == _bloc.listOfUsers.length - 1) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 10),
                          Text('Loading more Users...'),
                        ],
                      ),
                    ),
                  );
                } else {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        user.picture!.thumbnail!,
                      ),
                    ),
                    title: Text(user.name!.first!),
                    subtitle: Text(user.name!.last!),
                  );
                }
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
