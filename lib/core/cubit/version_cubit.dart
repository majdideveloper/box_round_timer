import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'version_state.dart';

class VersionCubit extends Cubit<VersionState> {
  VersionCubit() : super(VersionInitial());

  Future<void> loadVersion() async {
    try {
      emit(VersionLoading());
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String version = "${packageInfo.version} (${packageInfo.buildNumber})";
      emit(VersionLoaded(version));
    } catch (e) {
      emit(VersionError("Failed to load version"));
    }
  }
}
