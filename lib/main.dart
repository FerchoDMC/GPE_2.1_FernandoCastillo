import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

          // Widget 5 ── Image.network
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://assets.pokemon.com/assets/cms2/img/pokedex/full/094.png',
              height: 120,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.broken_image, color: Colors.white54, size: 60),
              ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(color: Color(0xFF00E1FF)),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // ── Card con elevation y RoundedRectangleBorder personalizados ───
          // RoundedRectangleBorder: permite definir bordes redondeados en widgets
          Card(
            elevation: 8,
            color: const Color(0xFF1B2A3B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Color(0xFF00E1FF), width: 1.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Información de contacto',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(color: Color(0xFF00E1FF), height: 20),
                  Row(
                    children: const [
                      Icon(Icons.email, color: Color(0xFF00E1FF), size: 20),
                      SizedBox(width: 10),
                      Text(
                        'fecastilloar@uide.edu.ec',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.school, color: Color(0xFF00E1FF), size: 20),
                      SizedBox(width: 10),
                      Text(
                        'UIDE - Quinto Semestre',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Widget 6 ── ElevatedButton con debugPrint en onPressed
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00E1FF),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.send),
              label: const Text(
                'Enviar mensaje',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                // debugPrint: imprime en consola de depuración
                debugPrint('Abriendo WhatsApp: wa.me/593986285316');
                final Uri url = Uri.parse('https://wa.me/593986285316/?text=Hola%20Fernando%20Castillo');
                if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                  debugPrint('No se pudo abrir WhatsApp');
                }
              },
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),

      // ── FloatingActionButton con SnackBar via ScaffoldMessenger ──────────
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00E1FF),
        foregroundColor: Colors.black,
        tooltip: 'Saludar',
        onPressed: () {
          // ScaffoldMessenger: manera correcta de mostrar SnackBars en Flutter
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('¡Hola! Soy Fercho DMC 👋'),
              backgroundColor: const Color.fromARGB(255, 165, 205, 251),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 3),
            ),
          );
        },
        child: const Icon(Icons.waving_hand),
      ),
    );
  }
}
