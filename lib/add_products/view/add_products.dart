import 'package:doctor_plan_admin/cubit/upload_cubit/upload_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final UploadCubit cubit = UploadCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                // overlayColor: const MaterialStatePropertyAll(Color(0xFFC4D7E0)),
                indicatorColor: Colors.white,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: -45),
                indicator: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Constants.primaryColor, width: 1)),
                dividerColor: Colors.transparent,
                unselectedLabelColor: Colors.grey,
                labelColor:  Constants.primaryColor,

                tabs: const [
                  Tab(text: 'Add Plant'),
                  Tab(text: 'Add Fertlizer'),

                ],
              ),
            ),


            body: TabBarView(
              children: [
                ListView(
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
                        : const Center(child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("No Image Selected"),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),                child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Constants.primaryColor),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                )
                            )
                        ),
                        onPressed: () {
                          cubit.pickImageFromGallery();
                        },
                        child: const Text("Upload Image",style: TextStyle(color: Colors.white))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                      height: 25,
                    ),
                    state is AddProductLoading
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Constants.primaryColor),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  )
                              )
                          ),
                          onPressed: () {
                            cubit.uploadPlantData();
                          },
                          child: const Text("Save",style: TextStyle(color: Colors.white),)),
                    )
                  ],
                ),
                ListView(
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
                        : const Center(child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("No Image Selected"),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),                child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Constants.primaryColor),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                )
                            )
                        ),
                        onPressed: () {
                          cubit.pickImageFromGallery();
                        },
                        child: const Text("Upload Image",style: TextStyle(color: Colors.white))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                      height: 25,
                    ),
                    state is AddProductLoading
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Constants.primaryColor),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  )
                              )
                          ),
                          onPressed: () {
                            cubit.uploadFertlizerData();
                          },
                          child: const Text("Save",style: TextStyle(color: Colors.white),)),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

  }
}
