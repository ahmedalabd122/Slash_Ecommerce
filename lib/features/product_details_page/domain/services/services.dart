// contains all functions that I will use during the app

import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:slash_internship_assignment/features/product_details_page/data/model/get_product_variations.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/model/product_varition_images_model.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/model/variation_data_model.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/model/variation_model.dart';

class Services {
  GetProductVariations productVariations;
  Services({required this.productVariations});

  VariationData getProductVariationsData() {
    return productVariations.data!;
  }

  int getDefaultId() {
    return getProductVariationsData().variations![0].id!;
  }

  Map<String, String> getDefaultSelectedProperties() {
    Map<String, String> getDefaultSelectedProperties1 = {};
    for (int i = 0; i < getVariationsNum(); i++) {
      for (int j = 0; j < availablePropertiesList().length; j++) {
        getDefaultSelectedProperties1['property'] = productVariations
            .data!.variations![i].productPropertiesValues![j].property!;
        getDefaultSelectedProperties1['value'] = productVariations
            .data!.variations![i].productPropertiesValues![j].value!;
      }
    }
    return getDefaultSelectedProperties1;
  }

  int getVariationsNum() {
    return getProductVariationsData().variations!.length;
  }

  int getInitialImageCount() {
    return getProductVariationsData()
        .variations![0]
        .productVarientImages!
        .length;
  }

  int getImageCount(int id) {
    return getVariationById(id).productVarientImages!.length;
  }

  List<String> availablePropertiesList() {
    int availbleNumber = getProductVariationsData().avaiableProperties!.length;
    List<String> avPro = [];
    for (int i = 0; i < availbleNumber; i++) {
      avPro =
          avPro + [getProductVariationsData().avaiableProperties![i].property!];
    }
    return avPro;
  }

  Set<String> getAvailableMaterialsSet() {
    List<String> avMaterialsList = [];

    int propIndex = -1;
    for (int i = 0; i < availablePropertiesList().length; i++) {
      if (availablePropertiesList()[i] == 'Materials') {
        propIndex = i;
        break;
      }
    }
    if (propIndex == -1) {
      return avMaterialsList.toSet();
    }
    int avMaterialsNum = getProductVariationsData()
        .avaiableProperties![propIndex]
        .values!
        .length;

    for (int i = 0; i < avMaterialsNum; i++) {
      String m = getProductVariationsData()
          .avaiableProperties![propIndex]
          .values![i]
          .value!;

      m = m.toUpperCase();
      avMaterialsList = avMaterialsList + [m];
    }
    return avMaterialsList.toSet();
  }

  Set<String> getAvailableColorsSet() {
    List<String> avColorsList = [];

    int propIndex = -1;
    for (int i = 0; i < availablePropertiesList().length; i++) {
      if (availablePropertiesList()[i] == 'Color') {
        propIndex = i;
        break;
      }
    }
    if (propIndex == -1) {
      return avColorsList.toSet();
    }
    int avColorsNum = getProductVariationsData()
        .avaiableProperties![propIndex]
        .values!
        .length;

    for (int i = 0; i < avColorsNum; i++) {
      String m = getProductVariationsData()
          .avaiableProperties![propIndex]
          .values![i]
          .value!;
      m = m.toUpperCase();
      avColorsList = avColorsList + [m];
    }
    return avColorsList.toSet();
  }

  Set<String> getAvailableSizesSet() {
    List<String> avSizesList = [];

    int propIndex = -1;
    for (int i = 0; i < availablePropertiesList().length; i++) {
      if (availablePropertiesList()[i] == 'Size') {
        propIndex = i;
        break;
      }
    }
    if (propIndex == -1) {
      return avSizesList.toSet();
    }
    int avSizesNum = getProductVariationsData()
        .avaiableProperties![propIndex]
        .values!
        .length;

    for (int i = 0; i < avSizesNum; i++) {
      String m = getProductVariationsData()
          .avaiableProperties![propIndex]
          .values![i]
          .value!;
      m = m.toUpperCase();
      avSizesList = avSizesList + [m];
    }
    return avSizesList.toSet();
  }

  Variation getVariationById(int id) {
    for (int i = 0; i < getVariationsNum(); i++) {
      if (getProductVariationsData().variations![i].id == id) {
        return getProductVariationsData().variations![i];
      }
    }
    return getProductVariationsData().variations![0];
  }

  int getPriceByVId(int id) {
    return getVariationById(id).price!;
  }

  List<ProductVarientImage> getImagesByVId(int id) {
    return getVariationById(id).productVarientImages!;
  }
// {id:{color:red,size:l,material:cotton}}

  Map<int, dynamic> getVariaionsPropertyMapList() {
    Map<int, dynamic> getVariaionsPropertyMapList1 = {};
    int id = -1;
    for (int i = 0; i < getVariationsNum(); i++) {
      Map<String, String> m = {};
      for (int j = 0; j < availablePropertiesList().length; j++) {
        m[productVariations
                .data!.variations![i].productPropertiesValues![j].property!] =
            productVariations
                .data!.variations![i].productPropertiesValues![j].value!;
        id = productVariations.data!.variations![i].id!;
      }

      getVariaionsPropertyMapList1[id] = m;
    }
    return getVariaionsPropertyMapList1;
  }

  Map<int, int> getVariaionsIndexMapList() {
    Map<int, int> getVariaionsIndexMapList1 = {};
    for (int i = 0; i < getVariationsNum(); i++) {
      Map<int, int> m = {
        productVariations.data!.variations![i].id!: i,
      };
      getVariaionsIndexMapList1 = m;
    }
    return getVariaionsIndexMapList1;
  }

  int getVariationIndexById(int id) {
    return getVariaionsIndexMapList()[id]!;
  }

  int checkInStock(Map<String, String> selectedProperty) {
    // color + size + material
    debugPrint('1  ${selectedProperty.toString()}');

    for (var value in getVariaionsPropertyMapList().values) {
      debugPrint('2  ${value.toString()}');
      if (mapEquals(value, selectedProperty)) {
        debugPrint('3  ${selectedProperty.toString()}');

        int key = getVariaionsPropertyMapList().keys.firstWhere((k) {
          debugPrint('4  ${selectedProperty.toString()}');
          debugPrint(
              '5  ${mapEquals(getVariaionsPropertyMapList()[k], value).toString()}');

          return mapEquals(getVariaionsPropertyMapList()[k], value);
        });
        log(key.toString());
        return key;
      }
      // var key = map.keys.firstWhere((k) => map[k] == 'Bag', orElse: () => null);
    }
    return -1;
  }
}
