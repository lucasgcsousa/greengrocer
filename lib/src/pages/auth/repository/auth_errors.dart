

String authErrorsString(String? code){

  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'E-mail e/ou senha inválidos.';

    case 'Invalid session token':
      return 'Token inválido';

    case 'INVALID_FULLNAME':
    return 'Ocorreu um erro ao cadastrar o usuário: Nome Inválido';
    
    case 'INVALID_PHONE':
    return 'Ocorreu um erro ao cadastrar o usuário: Celular Inválido';
    
    case 'INVALID_CPF':
    return 'Ocorreu um erro ao cadastrar o usuário: CPF Inválido';

    default:
      return 'Um erro indefinido ocorreu';
  }
}