import 'package:flutter/material.dart';

import 'beans/account_info_entity.dart';

class AccountModel with ChangeNotifier {
  AccountInfoEntity _accountInfo;

  AccountInfoEntity get accountInfo => _accountInfo;

  void setAccounInfo(AccountInfoEntity infoEntity) {
    _accountInfo = infoEntity;
    notifyListeners();
  }


}
