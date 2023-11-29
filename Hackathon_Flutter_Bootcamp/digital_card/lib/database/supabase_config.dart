import 'package:supabase_flutter/supabase_flutter.dart';

Future supabaseConfig() async {
  await Supabase.initialize(
      url: 'https://lfxssbwvddzfuvkvabsp.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxmeHNzYnd2ZGR6ZnV2a3ZhYnNwIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5OTg2NTg4OSwiZXhwIjoyMDE1NDQxODg5fQ.ZoqXheJBne43wwEIgGyhHtHnLxa2brZD9e4oR-gYLTY');
}
