import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20%20';
import 'package:flutter_bloc_all/bloc/image_picker/iamge_picker_event.dart';
import 'package:flutter_bloc_all/bloc/image_picker/iamge_picker_states.dart';
import 'package:flutter_bloc_all/bloc/image_picker/image_picker_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Bloc'),
      ),  
      body: Center(
        child: BlocBuilder<ImagePickerBloc,ImagePickerStates>(
            builder: (context,state){
              if(state.file == null){
                return InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  child: const  CircleAvatar(
                    child: Icon(Icons.camera),
                  ),
                );
              }else{
                return Image.file(File(state.file!.path.toString()));
              }
            }
        ),
      ),
    );
  }
}

