import 'package:bloc/bloc.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/PostgramAPI.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/models/PhotoData.dart';

part 'ImageListBlocEvent.dart';
part 'ImageListBlocState.dart';

class ImageListBloc extends Bloc<ImageListBlocEvent, ImageListBlocState> {
  ImageListBloc() : super(ImageListInit()) {
    on<LoadImageListEvent>((event, emit) async {
      final List<PhotoData> _imageListPhoto = await PostgramAPI().getPhotos();
      emit(ImageListLoaded(listPhotoData: _imageListPhoto));
    });
  }
}
