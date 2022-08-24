import 'dart:async';
import 'package:fintech_app_ui/components/kElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../components/balance_container.dart';
import '../../constants/color.dart';

class Withdraw extends StatefulWidget {
  static const routeName = '/withdraw';

  const Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

enum Field {
  password,
  pin,
  amount,
  accountNumber,
  accountName,
}

class _WithdrawState extends State<Withdraw> {
  final _formKey = GlobalKey<FormState>();
  final _addBankFormKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _pinController = TextEditingController();
  final _amountController = TextEditingController();
  final _accountNumber = TextEditingController();
  final _accountName = TextEditingController();
  var passwordObscure = true;
  var pinObscure = true;
  var currentBank = 0;
  var currentBankName = 'Select Bank';
  var isLoading = false;
  final double kSize = 100;

  final _banks = [
    'Select Bank',
    'Access Diamond',
    'Access',
    'Fidelity',
    'FCMB',
    'First Bank',
    'GTB',
    'Union Bank',
    'UBA',
    'Zenith',
    'Citibank',
    "Ecobank",
    'Heritage',
    'Keystone',
    'Polaris',
    'Stanbic IBTC',
    'Standard Chartered',
    'Sterling',
    'Titan Trust',
    'Unity',
    'Wema',
    'Globus',
    'Parallex',
    'Providus',
    'SunTrust',
    'Jaiz',
    'LOTUS BANK',
    'TAJBank Limited',
    'Mutual Trust Microfinance',
    'Rephidim Microfinance',
    'Shepherd Trust Microfinance',
    'Empire Trust Microfinance',
    'Finca Microfinance',
    'Fina Trust Microfinance',
    'Accion Microfinance',
    'Peace Microfinance',
    'Infinity Microfinance',
    'Pearl Microfinance',
    'Covenant Microfinance',
    'Advans La Fayette Microfinance',
    'Sparkle',
    'Kuda',
    'Rubies',
    'VFD Microfinance',
    'Mint Finex MFB',
    'Mkobo MFB',
    'Coronation Merchant',
    'FBNQuest Merchant',
    'FSDH Merchant',
    'Rand Merchant',
    'Nova Merchant',
  ];

  final bankAccounts = [
    {
      'name': 'Wema',
      'image': 'assets/images/wema.png',
      'number': 0323894530,
    },
    {
      'name': 'GTBank',
      'image': 'assets/images/gtbank.png',
      'number': 2023874534,
    },
    {
      'name': 'Access',
      'image': 'assets/images/access.png',
      'number': 6532704320,
    },
  ];

  // isLoad action
  _isLoadingAction() {
    setState(() {
      isLoading = true;
    });

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
    });
  }

  // withdraw action
  _withdraw() {
    // TODO: Implement Withdraw
    var valid = _formKey.currentState!.validate();
    if (!valid) {
      return null;
    } else {
      _isLoadingAction();
    }
  }

  // add bank action
  _addBank() {
    // TODO: Implement Add bank
    var valid = _addBankFormKey.currentState!.validate();
    if (!valid) {
      return null;
    } else {
      _isLoadingAction();
    }
  }

  // each bank
  Widget kContainer(
    int index,
    String name,
    String imgAsset,
    int number,
  ) {
    return GestureDetector(
      onTap: () => setState(() {
        currentBank = index;
      }),
      child: Card(
        elevation: 2,
        child: Container(
          width: 100,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: currentBank == index
                ? Border.all(
                    width: 1,
                    color: primaryColor,
                  )
                : null,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(imgAsset),
              ),
              // const SizedBox(height: 5),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: currentBank == index ? primaryColor : greyShade2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                number.toString(),
                style: TextStyle(
                  color: currentBank == index ? primaryColor : greyShade2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // custom textfield for password and pin
  Widget kTextField(
    TextEditingController controller,
    String text,
    bool obscure,
    Field field,
  ) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: field == Field.pin ||
              field == Field.amount ||
              field == Field.accountNumber
          ? TextInputType.number
          : TextInputType.text,
      textInputAction:
          field == Field.pin ? TextInputAction.done : TextInputAction.next,
      validator: (value) {
        switch (field) {
          case Field.password:
            if (value!.length < 8) {
              return 'Password is not strong';
            }
            if (value.isEmpty) {
              return 'Password can not be empty';
            }
            break;

          case Field.pin:
            if (value!.length < 3 || value.length > 4) {
              return 'Pin must be 4 characters';
            }
            break;

          case Field.amount:
            if (value!.isEmpty) {
              return 'Amount can not be empty';
            }
            break;

          case Field.accountNumber:
            if (value!.isEmpty) {
              return 'Account number can not be empty';
            }

            if (value.length < 10) {
              return 'Invalid account number';
            }
            break;

          case Field.accountName:
            if (value!.isEmpty) {
              return 'Account name can not be empty';
            }
        }

        return null;
      },
      decoration: InputDecoration(
        suffixIcon: field == Field.password || field == Field.pin
            ? controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () => setState(() {
                      if (field == Field.password) {
                        passwordObscure = !passwordObscure;
                      } else {
                        pinObscure = !pinObscure;
                      }
                    }),
                    icon: Icon(
                      obscure ? Icons.visibility : Icons.visibility_off,
                      color: primaryColor,
                    ),
                  )
                : const Text('')
            : const Text(''),
        label: Text(
          text,
          style: const TextStyle(
            color: primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: greyShade2,
          ),
        ),
      ),
    );
  }

  // dropdown add bank
  addBankDropDown() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
        ),
      ),
      context: context,
      builder: (context) => Form(
        key: _addBankFormKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Bank Account',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  label: const Text(
                    'Bank Name',
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1,
                      color: primaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1,
                      color: greyShade2,
                    ),
                  ),
                ),
                value: currentBankName,
                items: _banks
                    .map(
                      (data) => DropdownMenuItem(
                        value: data,
                        child: Text(data),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    currentBankName = value.toString();
                  });
                },
              ),
              const SizedBox(height: 10),
              kTextField(
                _accountNumber,
                'Enter Account Number',
                false,
                Field.accountNumber,
              ),
              const SizedBox(height: 10),
              kTextField(
                _accountName,
                'Enter Account Name',
                false,
                Field.accountName,
              ),
              const SizedBox(height: 10),
              isLoading
                  ? Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        color: primaryColor,
                        size: kSize,
                      ),
                    )
                  : KElevatedButton(
                      title: 'Add Bank',
                      icon: Icons.check_circle,
                      action: () => _addBank,
                    )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _passwordController.addListener(() {
      setState(() {});
    });
    _pinController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Withdraw',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.chevron_left,
              color: primaryColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BalanceContainer(),
                const SizedBox(height: 20),
                kTextField(
                  _amountController,
                  'Withdrawal Amount',
                  false,
                  Field.amount,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select receiving account',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => addBankDropDown(),
                      // TODO: Navigate to add new bank section
                      child: const Text(
                        '+ Add new bank',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 112,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: bankAccounts.length,
                    itemBuilder: (context, index) {
                      var bank = bankAccounts[index];
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: kContainer(
                          index,
                          '${bank["name"]}',
                          '${bank["image"]}',
                          int.parse(
                            '${bank['number']}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                kTextField(
                  _passwordController,
                  'Password',
                  passwordObscure,
                  Field.password,
                ),
                const SizedBox(height: 20),
                kTextField(
                  _pinController,
                  '4 Digit Pin',
                  pinObscure,
                  Field.pin,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Funds will be removed from your SwiftPay balance',
                  style: TextStyle(color: greyShade2),
                ),
                const SizedBox(height: 5),
                isLoading
                    ? Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: primaryColor,
                          size: kSize,
                        ),
                      )
                    : KElevatedButton(
                        title: 'Withdraw',
                        icon: Icons.check_circle,
                        action: () => _withdraw,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
