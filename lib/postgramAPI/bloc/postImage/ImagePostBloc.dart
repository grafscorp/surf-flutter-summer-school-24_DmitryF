// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_summer_school_24/postgramAPI/PostgramAPI.dart';

part 'ImagePostEvent.dart';
part 'ImagePostState.dart';

class ImagePostBloc extends Bloc<ImagePostEvent, ImagePostState> {
  ImagePostBloc() : super(ImagePostInit()) {
    on<LoadImagePostEvent>(
      (event, emit) async {
        try {
          if (await PostgramAPI().postPhoto(event.newPhoto)) {
            emit(ImagePostLoaded());
          } else {
            emit(ImagePostEror(exceptional: null));
          }
        } catch (e) {
          emit(ImagePostEror(exceptional: e));
        }
      },
    );
    on<InitImagePostEvent>(
      (event, emit) async {
        emit(ImagePostInit());
      },
    );
  }
}
