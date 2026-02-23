import 'package:get/get_utils/src/extensions/string_extensions.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu e-mail';
  }
  if (!email.isEmail) return 'digite um e-mail válido';

  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua senha';
  }

  if (password.length < 8) {
    return 'Digite uma senha com pelo menos 8 caracteres';
  }

  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite seu nome!';
  }

  final names = name.split(' ');

  if (names.length == 1) return 'Digite seu nome completo';

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite seu telefone!';
  }

  if (!phone.isPhoneNumber || phone.length < 14){
    return 'Digite um número válido';
  }
    
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite seu CPF!';
  }

  if (!cpf.isCpf) return 'Digite um CPF válido';

  return null;
}
