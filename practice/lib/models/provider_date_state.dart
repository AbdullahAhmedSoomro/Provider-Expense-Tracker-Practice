import 'package:flutter/cupertino.dart';
import 'package:practice/models/provider_date_model.dart';

class ProviderDateState extends ChangeNotifier {
  ProviderDateModel? a;
  updateDate(ProviderDateModel newData) {
    a = newData;
    notifyListeners();
  }
}
