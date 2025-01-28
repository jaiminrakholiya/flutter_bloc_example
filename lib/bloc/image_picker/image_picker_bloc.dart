import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_all/bloc/image_picker/iamge_picker_event.dart';
import 'package:flutter_bloc_all/bloc/image_picker/iamge_picker_states.dart';
import 'package:flutter_bloc_all/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerStates>{

  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils): super(const ImagePickerStates()){
    on<CameraCapture>(cameraCapture);
  }

  void cameraCapture(CameraCapture event,Emitter<ImagePickerStates> states)async{
          XFile? file = await imagePickerUtils.cameraCapture();
          emit(state.copyWith(file: file));
  }
}