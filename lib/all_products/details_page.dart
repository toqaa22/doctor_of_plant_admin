import 'package:doctor_plan_admin/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:doctor_plan_admin/models/data_set_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../models/fertlizer_model.dart';
import '../models/plant_model.dart';

class DetailsPage extends StatelessWidget {
  final PlantModel? plant;
  final FertilizerModel? fertilizerModel;
  final DataSetModel? dataSetModel;

  const DetailsPage({super.key, this.plant, this.fertilizerModel,this.dataSetModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProductsCubit, GetProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final GetProductsCubit cubit = GetProductsCubit.get(context);
        fertilizerModel == null?
        GetProductsCubit.get(context).initializePlants(plant!)
            :
        GetProductsCubit.get(context).initializeFertlizers(fertilizerModel!);
        return Scaffold(
          body: ListView(
            children: [
              SizedBox(
                height: 350,
                child: Image.network(fertilizerModel == null
                    ? plant!.image!
                    : fertilizerModel!.image!),
              ),
              fertilizerModel == null?
                  Column(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: TextField(
                          controller: cubit.plantNameController,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "plant Name"),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: TextField(
                          controller: cubit.plantPriceController,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "plant price"),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: TextField(
                          controller: cubit.plantTempController,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "plant Temp"),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: TextField(
                          controller: cubit.plantSizeController,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "plant Size"),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: TextField(
                          controller: cubit.plantHumidityController,
                          decoration:
                          const InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "plant Humidity"),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: TextField(
                          controller: cubit.plantCategoryController,
                          decoration:
                          const InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "plant Category"),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: TextField(
                          controller: cubit.plantDescrpController,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "Description"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      state is UpdatePlantLoading?
                      const Center(
                        child: CircularProgressIndicator(),
                      ):
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  WidgetStatePropertyAll(Constants.primaryColor),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                              onPressed: () {
                                cubit.updatePlant(
                                    plant!.plantId!, plant!,context);
                              },
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  const WidgetStatePropertyAll(Colors.redAccent),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                              onPressed: () {
                                cubit.deletePlant(plant!.plantId!, context);
                              },
                              child: const Text(
                                "Delete",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ],
                  )
                  :
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: TextField(
                      controller: cubit.fertlizerNameController,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Fertlizer Name"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: TextField(
                      controller: cubit.fertlizerPriceController,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Fertlizer price"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: TextField(
                      controller: cubit.fertlizerTypeController,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Fertlizer Type"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: TextField(
                      controller: cubit.fertlizerDescrpController,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Description"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  state is UpdateFertLoading?
                  const Center(
                    child: CircularProgressIndicator(),
                  ):
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Constants.primaryColor),
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)))),
                          onPressed: () {
                            cubit.updateFertlizer(
                                fertilizerModel!.id!, fertilizerModel!,context);
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  const WidgetStatePropertyAll(Colors.redAccent),
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)))),
                          onPressed: () {
                            cubit.deleteFertlizer(fertilizerModel!.id!, context);
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
