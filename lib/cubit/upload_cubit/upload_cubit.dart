import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_plan_admin/models/fertlizer_model.dart';
import 'package:doctor_plan_admin/models/plant_model.dart';
import 'package:doctor_plan_admin/toast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  static UploadCubit get(context) => BlocProvider.of(context);
  TextEditingController plantNameController = TextEditingController();
  TextEditingController plantDescrpController = TextEditingController();
  TextEditingController plantSizeController = TextEditingController();
  TextEditingController plantTempController = TextEditingController();
  TextEditingController plantHumidityController = TextEditingController();
  TextEditingController plantPriceController = TextEditingController();
  TextEditingController plantCategoryController = TextEditingController();
  TextEditingController fertlizerNameController = TextEditingController();
  TextEditingController fertlizerDescrpController = TextEditingController();
  TextEditingController fertlizerPriceController = TextEditingController();
  TextEditingController fertlizerTypeController = TextEditingController();




  String scanImage = '';
  PlantModel? plant;
  FertilizerModel?fertilizer;

  Future<void> pickImageFromGallery() async {
    emit(UploadImageLoading());
    if (kIsWeb) {
      await ImagePicker()
          .pickImage(source: ImageSource.gallery)
          .then((value) async {
        final image = await value!.readAsBytes();
        await FirebaseStorage.instance
            .ref()
            .child("plants/")
            .putData(
              image,
              SettableMetadata(contentType: 'image/png'),
            )
            .then((p0) async {
          await p0.ref.getDownloadURL().then((value) async {
            scanImage = value;
            emit(UploadImage());
          });
        });
      });
    } else {
      final picker = ImagePicker();

      await picker.pickImage(source: ImageSource.gallery).then((value) async {
        emit(UploadImageLoading());

        FirebaseStorage.instance
            .ref()
            .child("plants/")
            .putFile(File(value!.path.toString()))
            .then((value) {
          value.ref.getDownloadURL().then((value) async {
            scanImage = value;
            emit(UploadImage());
          });
        });
      });
    }
  }

  void uploadPlantData() async {
    emit(AddProductLoading());
    String plantId = FirebaseFirestore.instance.collection('plants').doc().id;
    plant = PlantModel(
        plantId: plantId,
        name: plantNameController.text,
        price: num.tryParse(plantPriceController.text),
        size: plantSizeController.text,
        image: scanImage,
        humidity: plantHumidityController.text,
        temperature: plantTempController.text,
        category: plantCategoryController.text,
        decription: plantDescrpController.text);
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('plants').doc(plantId);
      await docRef.set(plant!.toMap());
      await docRef.update({'ref': docRef});

      emit(AddProductSuccessfully());
      showToast("Plant Uploaded");
      plantNameController.clear();
      plantDescrpController.clear();
      plantSizeController.clear();
      plantTempController.clear();
      plantHumidityController.clear();
      plantPriceController.clear();
      plantCategoryController.clear();
      scanImage = '';
    } catch (e) {
      print("Error uploading plant data: $e");
    }
  }
  void uploadFertlizerData() async {
    emit(AddProductLoading());
    String fertlizerId = FirebaseFirestore.instance.collection('fertilizer').doc().id;
    fertilizer = FertilizerModel(
      type: fertlizerTypeController.text,
        id: fertlizerId,
        name: fertlizerNameController.text,
        price: num.tryParse(fertlizerPriceController.text),
        image: scanImage,
        description: fertlizerDescrpController.text);
    try {
      DocumentReference docRef =
      FirebaseFirestore.instance.collection('fertilizer').doc(fertlizerId);
      await docRef.set(fertilizer!.toMap());
      await docRef.update({'ref': docRef});

      emit(AddProductSuccessfully());
      showToast("Fertlizer Uploaded");
      fertlizerNameController.clear();
      fertlizerPriceController.clear();
      fertlizerDescrpController.clear();
      fertlizerTypeController.clear();
      scanImage = '';
    } catch (e) {
      print("Error Fertlizer plant data: $e");
    }
  }
}
