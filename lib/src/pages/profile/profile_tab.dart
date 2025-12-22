import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.customSwatchColor,
          title:const Text(
            'Perfil do usuário',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        actions: [
          IconButton(onPressed:() {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),

      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.email ,
            icon: Icons.email,
            label: 'E-mail',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.name,
            icon: Icons.person,
            label: 'Nome',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.phone,
            icon: Icons.phone,
            label: 'Celular',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF', isSecret: true,
          ),

          SizedBox(
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  side: BorderSide(
                          width: 2,
                          color: Colors.green
                  ),
                ),
                onPressed: () {
                  updatePassword();
                },
              child: const Text(
                'Atualizar senha',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(context: context, builder:(context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Título
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Atualização de senha',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  
                  //Senha atual
                  const CustomTextField(isSecret: true, icon: Icons.lock, label: 'Senha atual'),
                  
                  //Nova senha              
                  const CustomTextField(isSecret: true, icon: Icons.lock_outline, label: 'Nova senha'),
                  
                  //Confirmação nova senha            
                  const CustomTextField(isSecret: true, icon: Icons.lock_outline, label: 'Confirmar nova senha'),
            
                  //Botão confirmação
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: (){},
                      child: const Text(
                        'Atualizar', 
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed:() {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        )
      );
    },
    );
  }
}