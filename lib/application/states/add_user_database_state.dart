import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:puzzle_map/models/user_info.dart';

part 'add_user_database_state.freezed.dart';

@freezed
class AddUserDatabaseState with _$AddUserDatabaseState {
  const factory AddUserDatabaseState() = AddUserDatabaseIdle;
  const factory AddUserDatabaseState.processing() = AddUserDatabaseProcessing;
  const factory AddUserDatabaseState.done(EUserData user) = AddUserDatabaseDone;
  const factory AddUserDatabaseState.error({String? message}) =
      AddUserDatabaseError;
}
