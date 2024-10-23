import 'package:supabase_flutter/supabase_flutter.dart';

class ConexaoSupabase {
  static final SupabaseClient _cliente = Supabase.instance.client;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://xdiinewdlxnqfetsggzp.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhkaWluZXdkbHhucWZldHNnZ3pwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc5NzA1MjgsImV4cCI6MjA0MzU0NjUyOH0.tbjQxhdfch2NMefBL8vO82bDt4JQnb_jZ78PZ-WBBZ8',
    );
  }

  static SupabaseClient get client => _cliente;

  static void dispose() {
    Supabase.instance.client.auth.signOut();
  }
}
