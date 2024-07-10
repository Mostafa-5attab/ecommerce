import 'package:ecommerce/app/Services/get_new_test.dart';
import 'package:get/get.dart';

import '../../../model/new_model.dart';

class NewTestController extends GetxController {
  var newTestList = <NewModel> [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNewTest();
  }

  void getNewTest(int id ) async {
    List<NewModel> newTest = (await  getTest.getNew(id));
    try {
      isLoading(true);
      if (newTest.isNotEmpty) {
        newTestList.addAll(newTest);
      }
    } finally {
      isLoading(false);
    }
  }
}
