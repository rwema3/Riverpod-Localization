import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpodlocalization/models/locale/locale_state.dart';
import 'package:riverpodlocalization/widgets/language_picker.dart';



    return MaterialApp(
      title: 'Riverpod Localization',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: _supportedLocales,
      locale: _locale,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    var widgetsBinding = WidgetsBinding.instance;
    if (widgetsBinding != null) {
      widgetsBinding.addPostFrameCallback((_) async {
        // Locale Startup Actions
        ref.read(localeStateProvider.notifier).initLocale();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Create a DateFormat for the current locale
    final DateFormat dateFormat = DateFormat.yMd(ref.read(localeProvider).toString()).add_jms();

    String _supportedLocales = ref.read(supportedLocalesProvider).toString();
    String _platformLocale = ref.read(platformLocaleProvider).toString();
    String _currentLocale = ref.watch(localeProvider).toString();

    print("Supported locales: " + _supportedLocales);
    print("Platform Locale: " + _platformLocale);
    print("Current Locale: " + _currentLocale);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Localization'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Platform Locale: " + _platformLocale),
                    const SizedBox(height: 5),
                    Text("Locale via Localizations: " + Localizations.localeOf(context).toString()),
                    const SizedBox(height: 5),
                    Text("Locale via Riverpod State: " + _currentLocale),
                    const SizedBox(height: 20.0),
                    Text(AppLocalizations.of(context)!.helloWorld),
                    const SizedBox(height: 20.0),
                    Text(dateFormat.format(DateTime.now())),
                    const SizedBox(height: 20.0),
                    Text(AppLocalizations.of(context)!.homeExplanation),
                    const SizedBox(height: 20.0),
                    Text(AppLocalizations.of(context)!.homeExplanation2),
                    const SizedBox(height: 20.0),
                    const LanguagePicker(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
