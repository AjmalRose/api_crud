import 'dart:developer';

import 'package:api_crud/models/user_models.dart';
import 'package:api_crud/service/api_service.dart';
import 'package:flutter/material.dart';

class CrudProvider extends ChangeNotifier {
  TextEditingController titleContoller = TextEditingController();

  CrudApi crudApi = CrudApi();
  List<CrudModel> crudValue = [];
  bool isLoadding = false;

  Future<void> getData() async {
    isLoadding = true;
    try {
      crudValue = await crudApi.getCrudData();
      if (crudValue.isEmpty) {
        log('no value found');
      }
    } catch (e) {
      throw Exception(' no data: $e');
    } finally {
      isLoadding = false;
      notifyListeners();
    }
  }

  Future<void> add() async {
    if (titleContoller.text.isEmpty) {
      log('value is empty');
      return;
    }
    isLoadding = true;
    notifyListeners();

    try {
      await crudApi.addData(CrudModel(title: titleContoller.text));
      titleContoller.clear();
      await getData();
    } catch (e) {
      throw Exception('failed');
    } finally {
      isLoadding = false;
      notifyListeners();
    }
  }

  Future<void> dltProvider(String id) async {
    isLoadding = true;
    notifyListeners();
    try {
      await crudApi.dltCrud(id);
      await getData();
    } catch (e) {
      log('errorrr');
    } finally {
      isLoadding = false;
      notifyListeners();
    }
  }
}
