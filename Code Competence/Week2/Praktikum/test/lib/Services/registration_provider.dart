// registration_provider.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/screens/registration_view_model.dart';

class RegistrationProvider extends ChangeNotifier {
  final Widget child;
  final RegistrationViewModel viewModel;

  RegistrationProvider({required this.child, required this.viewModel});

  static RegistrationViewModel of(BuildContext context) {
    return context.read<RegistrationViewModel>();
  }
}
