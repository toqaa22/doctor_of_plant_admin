part of 'upload_cubit.dart';


sealed class UploadState {}

final class UploadInitial extends UploadState {}
final class UploadImage extends UploadState {}
final class UploadImageLoading extends UploadState {}
final class AddProductSuccessfully extends UploadState {}
final class AddProductLoading extends UploadState {}
