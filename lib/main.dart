import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Perfil - S2_A1',
      // ── ThemeData con más de 3 propiedades modificadas ──────────────────
      theme: ThemeData(
        // 1. useMaterial3: activa el diseño Material You (más moderno)
        useMaterial3: true,
        // 2. colorScheme: paleta de colores global de la app
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00E1FF),
          brightness: Brightness.dark,
        ),
        // 3. scaffoldBackgroundColor: color de fondo de todos los Scaffolds
        scaffoldBackgroundColor: const Color(0xFF0D1B2A),
        // 4. textTheme: estilos de texto globales
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            color: Color(0xFF90CAF9),
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar con título, backgroundColor y action con ícono funcional ──
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: const Color(0xFF1B2A3B),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Acerca de',
            onPressed: () {
              debugPrint('Ícono de información presionado');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Actividad 1 - Programación Móvil'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      // ── Body con ListView para que sea scrollable ─────────────────────────
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Widget 1 ── CircleAvatar (foto de perfil)
          Center(
            child: CircleAvatar(
              radius: 75,
              backgroundColor: const Color(0xFF00E1FF),
              backgroundImage: const NetworkImage(
                'https://instagram.fuio13-1.fna.fbcdn.net/v/t51.82787-19/523584439_17845809120536923_8192931801926276280_n.jpg?stp=dst-jpg_s150x150_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=instagram.fuio13-1.fna.fbcdn.net&_nc_cat=107&_nc_oc=Q6cZ2gFiXi0SMyAcEeXCJiXucgnRosvpmcMbf0zlhZsUpnayC1tQKdiMsNYr6T1RfxhNIu0&_nc_ohc=RptFqFkKOncQ7kNvwH26UQr&_nc_gid=1x-POTzyLWr7Wnvvme-b1A&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_Af7lNJrurKHKlz-BywBw4ja7UoYyx5f0NAaa7XMCK84CrQ&oe=6A01BB91&_nc_sid=7a9f4b',
              ),
              onBackgroundImageError: (_, __) {},
              child: null,
            ),
          ),

          const SizedBox(height: 16),

          // Widget 2 ── Nombre completo
          Center(
            child: Text(
              'Fernando Castillo',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          const SizedBox(height: 6),

          // Widget 3 ── Número de cédula
          Center(
            child: Text(
              'C.I.: 1150076980',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          const SizedBox(height: 4),

          // Widget 4 ── Carrera
          Center(
            child: Text(
              'Ingeniería en Tecnologías de la Información',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
