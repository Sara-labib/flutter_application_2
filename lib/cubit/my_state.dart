part of 'my_cubit.dart';

@immutable
abstract class MyState {}

class MyInitial extends MyState {}

class GetAllUsers extends MyState {
  final List<User> allUsersList;

  GetAllUsers(this.allUsersList);
}

class GetUserDetails extends MyState {
  final User userDetails;

  GetUserDetails(this.userDetails);
}

class CreateNewUser extends MyState {
  final User newUser;

  CreateNewUser(this.newUser);
}

class DeleteUser extends MyState {
  final dynamic data;

  DeleteUser(this.data);
}
