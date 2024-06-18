import 'package:doctor_plan_admin/all_products/widget/plant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubit/get_products_cubit/get_products_cubit.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    GetProductsCubit.get(context).getPlants();
    GetProductsCubit.get(context).getFertilizers();
    return DefaultTabController(
      length: 2,
      child: BlocConsumer<GetProductsCubit, GetProductsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final GetProductsCubit cubit = GetProductsCubit.get(context);
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
                labelColor: Constants.primaryColor,

                tabs: const [
                  Tab(text: 'All Fertlizers'),
                  Tab(text: 'All Plants'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                      itemCount: cubit.fertilizers.length,
                      scrollDirection: Axis.vertical,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {}, child: PlantWidget(index: index, plantList: cubit.fertilizers));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                      itemCount: cubit.plants.length,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {}, child: PlantWidget(index: index, plantList: cubit.plants));
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
