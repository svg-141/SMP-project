import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static const String supabaseUrl = 'https://ldlarcldecitodbfvyxr.supabase.co';
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxkbGFyY2xkZWNpdG9kYmZ2eXhyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI2MTAzODMsImV4cCI6MjA2ODE4NjM4M30.Q_Zpoy74WxVevrBoLksNRoewZQoEtwxlJq45tLCJMPw';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
} 