import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt it=GetIt.instance;
Future<void> getIt()async{
  SharedPreferences sp=await SharedPreferences.getInstance();
  it.registerLazySingleton<SharedPreferences>(() => sp,);

}