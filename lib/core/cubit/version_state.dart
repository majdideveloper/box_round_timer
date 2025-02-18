part of 'version_cubit.dart';

abstract class VersionState extends Equatable {
  @override
  List<Object> get props => [];
}

class VersionInitial extends VersionState {}

class VersionLoading extends VersionState {}

class VersionLoaded extends VersionState {
  final String version;
  VersionLoaded(this.version);

  @override
  List<Object> get props => [version];
}

class VersionError extends VersionState {
  final String message;
  VersionError(this.message);

  @override
  List<Object> get props => [message];
}
