import 'package:auth/sign_in/data/repository/sign_in_repository_impl.dart';
import 'package:auth/sign_in/domain/repository/sign_in_repository.dart';
import 'package:core/core.dart';

Future<void> initServiceLocator() async {
  di.registerFactory<SignRepository>(
    () => SigInRepositoryImpl(),
  );
}
