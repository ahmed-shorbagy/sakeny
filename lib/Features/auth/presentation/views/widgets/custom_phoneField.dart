import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:sakeny/generated/l10n.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField(
      {super.key,
      required this.autoValidateMode,
      required this.onChanged,
      this.initialValue});

  final AutovalidateMode autoValidateMode;
  final void Function(PhoneNumber?) onChanged;
  final PhoneNumber? initialValue;
  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      initialValue: initialValue,
      defaultCountry: IsoCode.EG,
      autovalidateMode: autoValidateMode,
      validator: PhoneValidator.compose([
        // list of validators to use
        PhoneValidator.required(errorText: S.of(context).thisIsRequired),
        PhoneValidator.validMobile(),
        // ..
      ]),
      style: Theme.of(context).textTheme.titleMedium,
      keyboardType: const TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1.5,
        )),
        label: Text(S.of(context).yourmobile),
        labelStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Colors.grey.withOpacity(0.6)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
