import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_plan_admin/models/plant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/fertlizer_model.dart';
import '../../toast.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());

  static GetProductsCubit get(context) => BlocProvider.of(context);
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

  List<FertilizerModel> fertilizers = [];
  List<PlantModel> plants = [];

  void initializeFertlizers(FertilizerModel fertilizerModel) {
    fertlizerNameController.text = fertilizerModel.name!;
    fertlizerDescrpController.text = fertilizerModel.description!;
    fertlizerPriceController.text = fertilizerModel.price.toString();
    fertlizerTypeController.text = fertilizerModel.type!;
  }
  void initializePlants(PlantModel plantModel) {
    plantNameController.text = plantModel.name!;
    plantDescrpController.text = plantModel.decription!;
    plantPriceController.text = plantModel.price.toString();
    plantCategoryController.text = plantModel.category!;
    plantSizeController.text = plantModel.size!;
    plantHumidityController.text = plantModel.humidity!;
    plantTempController.text = plantModel.temperature!;
  }

  void getFertilizers() {
    emit(GetAllFertilizersLoading());
    FirebaseFirestore.instance
        .collection('fertilizer')
        .get()
        .then((value) async {
      fertilizers.clear();
      for (var element in value.docs) {
        fertilizers.add(FertilizerModel.fromJson(element.data(),));
      }
      emit(GetFertlizers());
    }).catchError((onError) {});
  }
  void getPlants() {
    emit(GetAllPlantsLoading());
    FirebaseFirestore.instance
        .collection('plants')
        .get()
        .then((value) async {
      plants.clear();
      for (var element in value.docs) {
        plants.add(PlantModel.fromJson(element.data(),));
      }
      emit(GetPlants());
    }).catchError((onError) {});
  }

  void updateFertlizer(String fertlizerId, FertilizerModel fertilizerModel,BuildContext context) async{
    emit(UpdateFertLoading());
    var fertlizerDoc =
        FirebaseFirestore.instance.collection('fertilizer').doc(fertlizerId);
    fertlizerDoc.update({
      'name': fertlizerNameController.text,
      'type': fertlizerTypeController.text,
      'price': num.tryParse(fertlizerPriceController.text),
      'description': fertlizerDescrpController.text,
    }).then((value) {
       initializeFertlizers(fertilizerModel);
      emit(UpdateFertlizer());
      GetFertlizers();
       showToast("Data Updated");
       Navigator.pop(context);
    });
  }
  void updatePlant(String plantID, PlantModel plantModel,BuildContext context) async{
    emit(UpdatePlantLoading());
    var plantDoc =
   FirebaseFirestore.instance.collection('plants').doc(plantID);
    plantDoc.update({
      'plantName': plantNameController.text,
      'category': plantCategoryController.text,
      'price': num.tryParse(plantPriceController.text),
      'decription': plantDescrpController.text,
      'humidity': plantHumidityController.text,
      'temperature': plantTempController.text,
      'size': plantSizeController.text,
    }).then((value) {
      initializePlants(plantModel);
      emit(UpdatePlant());
      getPlants();
      showToast("Data Updated");
      Navigator.pop(context);
    });
  }

  void deleteFertlizer(String fertlizeID,BuildContext context)async{
    await FirebaseFirestore.instance.collection('fertilizer').doc(fertlizeID).delete();
    getFertilizers();
    showToast("Fertlizer Deleted");
    Navigator.pop(context);
  }
  void deletePlant(String plantId,BuildContext context)async{
    await FirebaseFirestore.instance.collection('plants').doc(plantId).delete();
    getPlants();
    showToast("Plant Deleted");
    Navigator.pop(context);
  }
}
