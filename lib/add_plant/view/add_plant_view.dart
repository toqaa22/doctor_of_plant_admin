import 'package:doctor_plan_admin/cubit/upload_cubit/upload_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPlantView extends StatelessWidget {
  const AddPlantView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadCubit(),
      child: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final UploadCubit cubit = UploadCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Upload New Plant"),
            ),
            body: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                state is UploadImageLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : cubit.scanImage.isNotEmpty
                        ? Image.network(
                            cubit.scanImage,
                            height: 300,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                          )
                        : const Text("No Image Selected"),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      cubit.pickImageFromGallery();
                    },
                    child: const Text("Upload")),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: TextField(
                    controller: cubit.plantNameController,
                    decoration: const InputDecoration(hintText: "plant Name"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: TextField(
                    controller: cubit.plantPriceController,
                    decoration: const InputDecoration(hintText: "plant price"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: TextField(
                    controller: cubit.plantTempController,
                    decoration: const InputDecoration(hintText: "plant Temp"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: TextField(
                    controller: cubit.plantSizeController,
                    decoration: const InputDecoration(hintText: "plant Size"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: TextField(
                    controller: cubit.plantHumidityController,
                    decoration:
                        const InputDecoration(hintText: "plant Humidity"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: TextField(
                    controller: cubit.plantCategoryController,
                    decoration:
                        const InputDecoration(hintText: "plant Category"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: TextField(
                    controller: cubit.plantDescrpController,
                    decoration: const InputDecoration(hintText: "Description"),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                state is AddProductLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          cubit.uploadPlantData();
                        },
                        child: const Text("Upload"))
              ],
            ),
          );
        },
      ),
    );
  }
}
