import 'package:bex/constants/size.dart';
import 'package:bex/widgets/responsive_center.dart';
import 'package:bex/widgets/responsive_scrollable_cards.dart';
import 'package:flutter/material.dart';

import '../../../widgets/primary_button.dart';
import '../domain/address.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key, this.onSubmit});
  final VoidCallback? onSubmit;

  static const addressKey = Key('address');
  static const townCityKey = Key('townCity');
  static const stateKey = Key('state');
  static const postalCodeKey = Key('postalCode');
  static const countryKey = Key('country');
  static const scrollableKey = Key('addressPageScrollable');

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();

  final _isLoading = false;

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      final address = Address(
        address: _addressController.value.text,
        city: _cityController.value.text,
        state: _stateController.value.text,
        postalCode: _postalCodeController.value.text,
        country: _countryController.value.text,
      );
      // TODO: Only fire callback if submission is successful

      widget.onSubmit?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScrollableCard(
      key: AddressScreen.scrollableKey,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AddressFormField(
              formKeyField: AddressScreen.addressKey,
              controller: _addressController,
              labelText: 'Address',
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH48,
            AddressFormField(
              formKeyField: AddressScreen.townCityKey,
              controller: _cityController,
              labelText: 'Town/City',
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formKeyField: AddressScreen.stateKey,
              controller: _stateController,
              labelText: 'State',
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formKeyField: AddressScreen.postalCodeKey,
              controller: _postalCodeController,
              labelText: 'Postal Code',
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            AddressFormField(
              formKeyField: AddressScreen.countryKey,
              controller: _countryController,
              labelText: 'Country',
              keyboardType: TextInputType.streetAddress,
              enabled: !_isLoading,
            ),
            gapH8,
            PrimaryButton(
              text: 'Submit',
              onPressed: _submit,
              isLoading: _isLoading,
            )
          ],
        ),
      ),
    );
  }
}

class AddressFormField extends StatelessWidget {
  const AddressFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.enabled = true,
    this.formKeyField,
  });
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final bool enabled;
  final Key? formKeyField;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKeyField,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        enabled: enabled,
      ),
      autocorrect: true,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
      validator: (value) => value?.isNotEmpty == true ? null : 'Can\'t be null',
    );
  }
}
