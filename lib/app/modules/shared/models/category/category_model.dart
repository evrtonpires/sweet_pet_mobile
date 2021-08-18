import 'package:sweet_pet_mobile/util/constants/Icons_constants.dart';
import 'package:sweet_pet_mobile/util/constants/enums.dart';

class CategoryModel {
  final String Name;
  final String Icon;
  final eSpecie ESpecie;

  CategoryModel(
      {required this.Name, required this.Icon, required this.ESpecie});
}

List<CategoryModel> categoryList = [
  CategoryModel(
      Name: 'Caninos', ESpecie: eSpecie.CANINE, Icon: IconConstant.categoryDog),
  CategoryModel(
      Name: 'Felinos', ESpecie: eSpecie.FELINE, Icon: IconConstant.categoryCat),
];
