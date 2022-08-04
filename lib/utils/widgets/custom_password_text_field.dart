import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/theme/theme.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;
  @override
  State<CustomPasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<CustomPasswordTextField> {
  final _obsureText = '*';

  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      style: TextStyle(color: themeData.primaryColor),
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure,
      obscuringCharacter: _obsureText,
      decoration: InputDecoration(
        focusColor: Colors.black,
        border:  const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black)
        ),
        labelText: AppLocalizations.of(context).password,
        suffixIcon: _onVisiblityIcon(),
      ),
    );
  }

  IconButton _onVisiblityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      icon: AnimatedCrossFade(
        duration: const Duration(milliseconds: 500 ),
          firstChild: const Icon(Icons.visibility_outlined),
          secondChild: const Icon(Icons.visibility_off_outlined),
          crossFadeState:
              _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
    );
  }
}