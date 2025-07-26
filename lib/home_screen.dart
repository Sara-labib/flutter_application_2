import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/my_cubit.dart';
import 'package:flutter_application_2/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User user = User();

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    // BlocProvider.of<MyCubit>(context).emitGetUserDetails(8032241);

    // BlocProvider.of<MyCubit>(context).emitCreateNewUser(User(
    //     name: "mohamed ahmed",
    //     email: 'mohamed.ahmed@gmail.com',
    //     gender: "male",
    //     status: "active"));
    BlocProvider.of<MyCubit>(context).emitdeleteUser('8032241');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // BlocBuilder<MyCubit, MyState>(builder: (context, state) {
          //   if (state is GetAllUsers) {
          //     usersList = (state).allUsersList;
          //     return ListView.builder(
          //         itemCount: usersList.length,
          //         padding: EdgeInsets.all(8),
          //         shrinkWrap: true,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //             height: 50,
          //             color: Colors.amber,
          //             child: Center(
          //               child: Text(usersList[index].email.toString()),
          //             ),
          //           );
          //         },
          //         );
          //   } else {
          //     return const Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   }
          // },
          // )

          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is GetUserDetails) {
          //       user = (state).userDetails;
          //       return Container(
          //         height: 50,
          //         color: Colors.amber,
          //         child: Center(
          //           child: Text(user.name.toString()),
          //         ),
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )

          //
          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is CreateNewUser) {
          //       user = (state).newUser;
          //       return Container(
          //         height: 50,
          //         color: Colors.amber,
          //         child: Center(
          //           child: Text(user.name.toString()),
          //         ),
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )

          BlocBuilder<MyCubit, MyState>(
            builder: (context, state) {
              if (state is DeleteUser) {
                // user = (state).newUser;
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(
                    child: Text((state).data.toString()),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
