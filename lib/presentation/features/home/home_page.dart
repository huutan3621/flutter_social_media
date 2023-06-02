import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/home/home_drawer.dart';
import 'package:flutter_social_media/presentation/features/user/data/api/user_repository.dart';
import 'package:flutter_social_media/presentation/features/user/data/model/user_model.dart';
import 'package:flutter_social_media/shared/constants.dart';

class HomePage extends StatefulWidget {
  static const nameRoute = 'HomePage';
  // final String id;
  const HomePage({
    Key? key,
    // required this.id,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? _user;

  @override
  void initState() {
    super.initState();
    // getUserData(widget.id);
  }

  void getUserData(String uid) async {
    await UserRepo.getUserData(uid, updateUser);
  }

  void updateUser(UserModel user) {
    setState(() {
      _user = user;
      UserRepoX.shared.signedInUser = user;
      // UserRepoX.shared.userId = widget.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(),
        drawer: const HomeDrawer(),
        // drawer: HomeDrawer(

        // ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // WeekList(),
              // const Expanded(
              //   child: TodoRecords(),
              // )
            ],
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const TodoScreen(),
              //   ),
              // );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
