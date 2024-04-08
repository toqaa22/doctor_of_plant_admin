part of 'get_products_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}
final class GetAllFertilizersLoading extends GetProductsState {}
final class GetPlants extends GetProductsState {}
final class GetFertlizers extends GetProductsState {}
final class UpdatePlant extends GetProductsState {}
final class UpdateFertlizer extends GetProductsState {}
final class GetAllPlantsLoading extends GetProductsState {}
final class UpdatePlantLoading extends GetProductsState {}
final class UpdateFertLoading extends GetProductsState {}
