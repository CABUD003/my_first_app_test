import 'package:flutter/material.dart';

abstract class FirstPagekeys {
  static const Key incrementKey = Key('increment');
  static const Key nextPageKey = Key('go_to_second_page');
}

abstract class SecondPageKeys {
  static const Key dropdownKey = Key('dropdownWidget');
}
