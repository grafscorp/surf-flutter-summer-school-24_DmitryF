part of 'ImagePostBloc.dart';

class ImagePostEvent {}

class LoadImagePostEvent extends ImagePostEvent {
  final XFile newPhoto;

  LoadImagePostEvent({required this.newPhoto});
}

class InitImagePostEvent extends ImagePostEvent {}

class ErrorImagePostEvent extends ImagePostEvent {}
