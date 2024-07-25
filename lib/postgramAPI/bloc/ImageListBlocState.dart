part of 'ImageListBloc.dart';

class ImageListBlocState {}

class ImageListInit extends ImageListBlocState {}

class ImageListLoading extends ImageListBlocState {}

class ImageListLoaded extends ImageListBlocState {
  ImageListLoaded({required this.listPhotoData});
  final List<PhotoData> listPhotoData;
}

class ImageListFailed extends ImageListBlocState {}
