import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpodlocalization/models/locale/locale_state.dart';
import 'package:riverpodlocalization/widgets/language_picker.dart';

import 'models/locale/locale_providers.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get supported locales
    List<Locale> _supportedLocales = ref.read(supportedLocalesProvider);

    // Watch the current locale and rebuild on change
    Locale _locale = ref.watch(localeProvider);
    print("Rebuilding with watched locale: " + _locale.toString());

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
    // Create a DateFormat for the current lo
      

      
      
      

     
     
       

     
       
           
      
      
         
         
          
           
            
               
                  
                 
                   
                  
                    
                    
                    
                  
                  
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                  ],
                
              )
          
