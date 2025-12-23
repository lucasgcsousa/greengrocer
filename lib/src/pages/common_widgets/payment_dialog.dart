import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {

  final OrderModel order;

  PaymentDialog({
    super.key,
    required this.order,
  });

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //Conteudo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [          
                //Título
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Pagamento com Pix',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
              
                //QR Code
                QrImageView(
                  data: '1g56t8g41681vf6wr8g46t81g668416wt51f66581g651gf45684g',
                  version: QrVersions.auto,
                  size: 200.0,
                ),  
            
                //Vencimento
                Text(
                  'Vencimento: ${utilsServices.formatDateTime(order.overdueDateTime)}',
                  style: const TextStyle(fontSize: 12),
                ),
                //Total
                Text(
                  'Total: ${utilsServices.priceToCurrency(order.total)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                //Botão copia e cola
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20)
                    ),
                    side: BorderSide(
                      width: 2,
                      color: CustomColors.customSwatchColor,
                    ),
                  ),
                  onPressed:() {},
                  icon: Icon(Icons.copy, size: 15, color: CustomColors.customSwatchColor,),
                  label: Text(
                    'Copiar código Pix',
                    style: TextStyle(
                      fontSize: 13,
                      color: CustomColors.customSwatchColor
                    ),
                  ),
                ),
              ],
            ),
          ),
        
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed:() {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}