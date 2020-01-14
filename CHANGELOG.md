# Changelog

## 0.5.1

- Fix bug in string template logic not detecting `\` properly
- Fix bug in string template logic adding variable to beginning of substitution instead of the character immediately before, if present
- Fix bug in string template logic caused by match group 1 being null if the variable is at the beginning of the string


## 0.5.0 - ISO Localization

- Add all ISO language codes
- Add all ISO country codes
- Add all ISO locale codes
- Fix bug in string template regex not allowing variable at the beginning of a string


## 0.4.1

- Change `String.fillTemplate` regex to support escaping `$` with a `\`


## 0.4.0 - Add Plexus Localizations

- Add localization implementation from Plexus


## 0.3.0+2

- Add comment explaining try/on block to bypass useless lint


## 0.3.0 - Vastly improve `PatientStreamQueue`

- Fix logic in `PatientStreamQueue._onCancel`
- Split `PatientStreamQueue.dispose` into `PatientStreamQueue.close` returning a `Future<void>`, which disposes of the `PatientStreamQueue` waiting for events to be processed depending on the value of named parameter `wait`, and `PatientStreamQueue.dispose` returning a `void`, which disposes of the `PatientStreamQueue` without waiting for events to be processed
- Wrap `stdin.echoMode` calls in `prompt` and `promptSync` in try/catch to support platforms that don't support setting echo mode (ex. Dart-Code terminal output mode)
- Split example into 3 files
- Add example launch configuration


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
