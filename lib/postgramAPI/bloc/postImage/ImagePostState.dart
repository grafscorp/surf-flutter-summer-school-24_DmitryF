// ignore_for_file: file_names

part of 'ImagePostBloc.dart';

class ImagePostState {}

class ImagePostInit extends ImagePostState {}

class ImagePostLoading extends ImagePostState {}

class ImagePostLoaded extends ImagePostState {}

class ImagePostEror extends ImagePostState {
  final Object? exceptional;

  ImagePostEror({required this.exceptional});
}
