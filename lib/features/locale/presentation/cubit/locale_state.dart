part of 'locale_cubit.dart';

class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState({
    required this.locale,
  });

  factory LocaleState.initial() =>
      const LocaleState(locale: Locale(AppStrings.englishCode));

  @override
  List<Object> get props => [locale];

  @override
  String toString() => 'LocaleState(locale: $locale)';

  LocaleState copyWith({
    Locale? locale,
  }) {
    return LocaleState(
      locale: locale ?? this.locale,
    );
  }
}
