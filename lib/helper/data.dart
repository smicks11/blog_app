import 'package:blog_app/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = List<CategoryModel>.empty(growable: true);

  CategoryModel categoryModel = CategoryModel();

  //1
  categoryModel.label = "Business";
  // categoryModel.isSelected = false;
  category.add(categoryModel);


  categoryModel = CategoryModel();
  //2
  categoryModel.label = "Entertainment";
  // categoryModel.isSelected = false;
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //2
  categoryModel.label = "General";
  // categoryModel.isSelected = false;
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //2
  categoryModel.label = "Health";
  // categoryModel.isSelected = false;
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //2
  categoryModel.label = "Science";
  // categoryModel.isSelected = false;
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //2
  categoryModel.label = "Sports";
  // categoryModel.isSelected = false;
  category.add(categoryModel);

  categoryModel = CategoryModel();
  //2
  categoryModel.label = "Technology";
  // categoryModel.isSelected = false;
  category.add(categoryModel);

  return category; 
}
