# Changelog

## 0.2.2

- Fix logic in `PatientStreamQueue.dispose`


## 0.2.1

- Add `sendEncodedEvent()` for sending Plexus encoded events


## 0.2.0

- Add `encodedEventHeader` and `encodedEventSeparator` to `constants.dart`
- Fix `PatientStreamQueue.dispose`, `PatientStreamQueue._onListen` and `PatientStreamQueue._onCancel` logic
- Change typedefs to use generic function declaration syntax
- Enable `prefer_expression_function_bodies`, `prefer_generic_function_type_aliases` and `use_function_type_syntax_for_parameters` in `analysis_options.yaml`
- Switch `expose/list.dart` and `expose/maps.dart` to use generic typedefs instead of inline function declarations


## 0.1.0

Initial Development Release
