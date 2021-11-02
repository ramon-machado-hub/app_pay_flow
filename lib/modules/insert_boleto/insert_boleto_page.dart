import 'package:app_pay_flow/shared/themes/app_colors.dart';
import 'package:app_pay_flow/shared/themes/app_text_styles.dart';
import 'package:app_pay_flow/shared/widgets/input_text/input_text_widget.dart';
import 'package:app_pay_flow/shared/widgets/set_label_button/set_label_button.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'insert_boleto_controller.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({
    Key? key,
    this.barcode,
  }) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  BannerAd? bannerAd;
  bool isLoaded = false;
  final controller = InsertBoletoController();

  final moneyInputTextController = MoneyMaskedTextController(
      leftSymbol: "R\$", initialValue: 0, decimalSeparator: ",");
  final vencimentoInputTextController =
  MaskedTextController(mask: "00/00/0000");
  final codigoInputTextController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isLoaded = true;
            });
            print("Banner Ad Loaded");
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          }
      ),
      request: AdRequest(),
    );
    bannerAd!.load();
  }

  @override
  void initState() {
    if (widget.barcode != null) {
      codigoInputTextController.text = widget.barcode!;
      print(widget.barcode);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isLoaded ? Container(
                height: 50,
                child: AdWidget(
                  ad: bannerAd!,
                ),
              ) : SizedBox(),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 53, vertical: 4),
                child: Text(
                  "Preencha os dados do boleto",
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Column(
                    children: [
                      InputTextWidget(
                        keyboardType: TextInputType.name,
                        label: "Nome do boleto",
                        icon: Icons.description_outlined,
                        onChanged: (value) {
                          controller.onChange(name: value);
                        },
                        validator: controller.validateName,
                      ),
                      InputTextWidget(
                        keyboardType: TextInputType.datetime,
                        controller: vencimentoInputTextController,
                        label: "Vencimento",
                        icon: FontAwesomeIcons.timesCircle,
                        onChanged: (value) {
                          controller.onChange(dueDate: value);
                        },
                        validator: controller.validateVencimento,
                      ),
                      InputTextWidget(
                        keyboardType: TextInputType.number,
                        controller: moneyInputTextController,
                        label: "Valor",
                        icon: FontAwesomeIcons.wallet,
                        validator: (_) => controller
                            .validateValor(moneyInputTextController.numberValue),
                        onChanged: (value) {
                          controller.onChange(
                              value: moneyInputTextController.numberValue);
                        },
                      ),
                      InputTextWidget(
                        keyboardType: TextInputType.number,
                        controller: codigoInputTextController,
                        label: "Código",
                        icon: FontAwesomeIcons.barcode,
                        validator: controller.validateCodigo,
                        onChanged: (value) {
                          controller.onChange(barcode: value);
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          SetLabelButtons(
            enableSecondaryColor: true,
            labelPrimary: "Cancelar",
            onTapPrimary: () {
              Navigator.pop(context);
            },
            labelSecondary: "Cadastrar",
            onTapSecondary: () async {
              await controller.cadastrar();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}