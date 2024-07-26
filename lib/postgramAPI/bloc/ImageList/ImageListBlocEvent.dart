// ignore_for_file: file_names

part of 'ImageListBloc.dart';

class ImageListBlocEvent {}

class LoadImageListEvent extends ImageListBlocEvent {
  final Completer? completer;

  LoadImageListEvent({this.completer});
}

class InitImageListEvent extends ImageListBlocEvent {}

class ErrorImageLisrEvent extends ImageListBlocEvent {}
