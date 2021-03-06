import 'package:classe_a_clone/models/failure.dart';
import 'package:classe_a_clone/providers/auth_provider.dart';
import 'package:classe_a_clone/screens/main_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthForm extends ConsumerStatefulWidget {
  final bool isLogin;
  const AuthForm({required this.isLogin, Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends ConsumerState<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _datePicker = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _CPFController = TextEditingController();
  var dateFormatter = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  var phoneFormatter = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});
  var CPFFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  final authProvider = AuthProvider.authNotifier;

  @override
  void dispose() {
    _pass.dispose();
    _confirmPass.dispose();
    _datePicker.dispose();
    _phone.dispose();
    _CPFController.dispose();
    super.dispose();
  }

  bool _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!
          .save(); // Trigger the onSaved on every TextFormField
    }
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!widget.isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        // Return string if error and if ok return nothing
                        if (value!.isEmpty || value.length < 4) {
                          return 'Please anter at least 4 characters.';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.grey[300]),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          labelText: 'Nome',
                          labelStyle:
                              TextStyle(color: Colors.grey[600], fontSize: 14)),
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('email'),
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    enableSuggestions: false,
                    validator: (value) {
                      // Return string if error and if ok return nothing
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please Enter a valid email address.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.grey[300]),
                    decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 14)),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  if (!widget.isLogin)
                    TextFormField(
                      key: ValueKey('CPF'),
                      textInputAction: TextInputAction.next,
                      controller: _CPFController,
                      inputFormatters: [CPFFormatter],
                      keyboardType: TextInputType.number,
                      // validator: (value) {
                      //   // Return string if error and if ok return nothing
                      //   if (value!.isEmpty || value.length < 4) {
                      //     return 'Please anter at least 4 characters.';
                      //   }
                      //   return null;
                      // },
                      style: TextStyle(color: Colors.grey[300]),
                      decoration: InputDecoration(
                          labelText: 'CPF',
                          labelStyle:
                              TextStyle(color: Colors.grey[600], fontSize: 14)),
                      // onSaved: (value) {
                      //   _userName = value!;
                      // },
                    ),
                  if (!widget.isLogin)
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            key: ValueKey('phone'),
                            textInputAction: TextInputAction.next,
                            controller: _phone,
                            inputFormatters: [phoneFormatter],
                            // validator: (value) {
                            //   // Return string if error and if ok return nothing
                            //   if (value!.isEmpty || value.length < 4) {
                            //     return 'Please anter at least 4 characters.';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.grey[300]),
                            decoration: InputDecoration(
                                labelText: 'Telefone',
                                labelStyle: TextStyle(
                                    color: Colors.grey[600], fontSize: 14)),
                            onSaved: (value) {
                              _userName = value!;
                            },
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            key: ValueKey('datanasc'),
                            controller: _datePicker,
                            inputFormatters: [dateFormatter],
                            keyboardType: TextInputType.number,
                            // validator: (value) {
                            //   // Return string if error and if ok return nothing
                            //   if (value!.isEmpty || value.length < 4) {
                            //     return 'Please anter at least 4 characters.';
                            //   }
                            //   return null;
                            // },
                            style: TextStyle(color: Colors.grey[300]),
                            decoration: InputDecoration(
                              labelText: 'Data nascimento',
                              labelStyle: TextStyle(
                                  color: Colors.grey[600], fontSize: 13),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime(1994),
                                          firstDate: DateTime(1920),
                                          lastDate: DateTime(2020))
                                      .then((date) {
                                    var newDate = TextEditingValue(
                                        text:
                                            DateFormat('d/MM/y').format(date!));

                                    _datePicker.value = newDate;

                                    dateFormatter.formatEditUpdate(
                                        TextEditingValue.empty, newDate);
                                    print(dateFormatter.getMaskedText());
                                  });
                                },
                                icon: Icon(
                                  Icons.date_range_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // onSaved: (value) {
                            //   _userName = value!;
                            // },
                          ),
                        ),
                      ],
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          key: ValueKey('password'),
                          textInputAction: TextInputAction.next,
                          controller: _pass,
                          validator: (value) {
                            // Return string if error and if ok return nothing
                            if (value!.isEmpty || value.length < 7) {
                              return 'Password must be at least 7 characters long.';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.grey[300]),
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                                color: Colors.grey[600], fontSize: 14),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          obscureText: hidePassword,
                          onFieldSubmitted: (value) {},
                          onSaved: (value) {
                            _userPassword = value!;
                          },
                        ),
                      ),
                      if (!widget.isLogin) SizedBox(width: 15),
                      if (!widget.isLogin)
                        Expanded(
                          child: TextFormField(
                              controller: _confirmPass,
                              textInputAction: TextInputAction.next,
                              key: ValueKey('password2'),
                              style: TextStyle(color: Colors.grey[300]),
                              decoration: InputDecoration(
                                labelText: 'Repetir Senha',
                                labelStyle: TextStyle(
                                    color: Colors.grey[600], fontSize: 14),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hideConfirmPassword =
                                          !hideConfirmPassword;
                                    });
                                  },
                                  icon: Icon(
                                    hideConfirmPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              obscureText: hideConfirmPassword,
                              validator: (value) {
                                if (value != _pass.text) return 'Not Match';
                                return null;
                              }),
                        ),
                    ],
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () async {
                      bool isValid = _trySubmit();
                      if (isValid) {
                        try {
                          if (widget.isLogin) {
                            await ref
                                .read(authProvider)
                                .signInWithEmailAndPassword(
                                    _userEmail, _userPassword);
                          } else if (!widget.isLogin) {
                            await ref
                                .read(authProvider)
                                .signUpWithEmailAndPassword(
                                    _userEmail, _userPassword, _userName);
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Sucesso na autentica????o'),
                              backgroundColor: Colors.green[400],
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          Navigator.of(context)
                              .pushReplacementNamed(MainScreen.routeName);
                        } on Failure catch (failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(failure.toString()),
                              backgroundColor: Colors.red[400],
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }
                    },
                    child: Text(widget.isLogin ? 'ENTRAR' : 'CADASTRAR'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
