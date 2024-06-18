import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:expense_repository/expense_repository.dart';
import 'package:finance_tracker/screens/add_expense/blocs/create_category_bloc/create_category_bloc.dart';

createCategory(BuildContext context) {
  List<String> categoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];

  return showDialog(
    context: context,
    builder: (ctx) {
      bool isExpanded = false;
      bool isLoading = false;
      String iconSelected = '';
      Color categoryColor = Colors.white;

      TextEditingController categoryNameController = TextEditingController();
      TextEditingController categoryIconController = TextEditingController();
      TextEditingController categoryColorController = TextEditingController();

      return BlocProvider.value(
        value: context.read<CreateCategoryBloc>(),
        child: StatefulBuilder(builder: (context, setState) {
          return BlocListener<CreateCategoryBloc, CreateCategoryState>(
            listener: (context, state) {
              if (state is CreateCategoySuccess) {
                Navigator.pop(ctx);
              } else if (state is CreateCategoryLoading) {
                setState(() {
                  isLoading = true;
                });
              }
            },
            child: AlertDialog(
              title: const Text('Create a category'),
              backgroundColor: Colors.grey.shade100,
              content: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: categoryNameController,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: categoryIconController,
                      readOnly: true,
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Icon',
                        suffixIcon: const Icon(CupertinoIcons.chevron_down),
                        border: OutlineInputBorder(
                          borderRadius: isExpanded
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                )
                              : BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    isExpanded
                        ? Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                ),
                                itemCount: categoriesIcons.length,
                                itemBuilder: (context, int i) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        iconSelected = categoriesIcons[i];
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color:
                                            iconSelected == categoriesIcons[i]
                                                ? Colors.green
                                                : Colors.transparent,
                                        border: Border.all(
                                          width: 3,
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/${categoriesIcons[i]}.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: categoryColorController,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx2) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ColorPicker(
                                      pickerColor: Colors.blue,
                                      onColorChanged: (value) {
                                        categoryColor = value;
                                      },
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(ctx2);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: const Text(
                                          'Save',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: categoryColor,
                        hintText: 'Color',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: kToolbarHeight,
                      child: isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : TextButton(
                              onPressed: () {
                                Category category = Category.empty;
                                category.categoryId = const Uuid().v1();
                                category.name = categoryNameController.text;
                                category.icon = iconSelected;
                                category.color = categoryColor.toString();
                                context
                                    .read<CreateCategoryBloc>()
                                    .add(CreateCategory(category));
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    },
  );
}
