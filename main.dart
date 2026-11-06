import 'package:flutter/material.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF172554);
    const blue = Color(0xFF2563EB);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portofolio Hizzam',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        fontFamily: 'Roboto',
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            title: const Text('PORTOFOLIO', style: TextStyle(
              color: Color(0xFF172554), fontWeight: FontWeight.w800,
              letterSpacing: 1.4, fontSize: 16)),
            actions: [
              TextButton(onPressed: () => _goTo(context, 'Tentang Saya'),
                child: const Text('Tentang')),
              TextButton(onPressed: () => _goTo(context, 'Keahlian'),
                child: const Text('Keahlian')),
              const SizedBox(width: 12),
            ],
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF172554), Color(0xFF2563EB)],
                            begin: Alignment.topLeft, end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 82, height: 82,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.16),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white70, width: 2)),
                              child: const Center(child: Text('HAH',
                                style: TextStyle(color: Colors.white,
                                  fontSize: 23, fontWeight: FontWeight.bold))),
                            ),
                            const SizedBox(height: 24),
                            const Text('HALO, SAYA', style: TextStyle(
                              color: Color(0xFFBFDBFE), letterSpacing: 2,
                              fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            const Text('Hizzam Abdan Halim', style: TextStyle(
                              color: Colors.white, fontSize: 30,
                              fontWeight: FontWeight.w800)),
                            const SizedBox(height: 8),
                            const Text('Mahasiswa Informatika',
                              style: TextStyle(color: Colors.white, fontSize: 17)),
                            const SizedBox(height: 18),
                            const Text('Selamat datang di halaman portofolio pribadi saya.',
                              style: TextStyle(color: Colors.white70, height: 1.5)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 26),
                      _sectionTitle('Tentang Saya', 'Perkenalan singkat'),
                      _infoCard(
                        icon: Icons.person_outline,
                        title: 'Profil',
                        child: const Text(
                          'Saya adalah mahasiswa Program Studi Informatika. '
                          'Deskripsi diri akan ditambahkan kemudian.',
                          style: TextStyle(height: 1.6, color: Color(0xFF475569))),
                      ),
                      const SizedBox(height: 22),
                      _sectionTitle('Informasi Pendidikan', 'Data akademik'),
                      _infoCard(
                        icon: Icons.school_outlined,
                        title: 'Pendidikan',
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Program Studi Informatika',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                            SizedBox(height: 5),
                            Text('NPM: 202517161001',
                              style: TextStyle(color: Color(0xFF64748B))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      _sectionTitle('Keahlian', 'Hal yang sedang dipelajari'),
                      Wrap(spacing: 10, runSpacing: 10, children: const [
                        _SkillChip(label: 'Flutter'),
                        _SkillChip(label: 'Dart'),
                        _SkillChip(label: 'UI Design'),
                        _SkillChip(label: 'Pemrograman Mobile'),
                      ]),
                      const SizedBox(height: 22),
                      _sectionTitle('Pengalaman & Proyek', 'Karya dan aktivitas'),
                      _infoCard(
                        icon: Icons.code,
                        title: 'Proyek',
                        child: const Text(
                          'Bagian proyek dan pengalaman dapat diisi setelah data tersedia.',
                          style: TextStyle(height: 1.6, color: Color(0xFF475569))),
                      ),
                      const SizedBox(height: 22),
                      _sectionTitle('Kontak', 'Hubungi saya'),
                      _infoCard(
                        icon: Icons.mail_outline,
                        title: 'Informasi Kontak',
                        child: const Text(
                          'Alamat email dan media sosial akan ditambahkan kemudian.',
                          style: TextStyle(height: 1.6, color: Color(0xFF475569))),
                      ),
                      const SizedBox(height: 34),
                      const Center(
                        child: Text('© 2026 Hizzam Abdan Halim • Portofolio Pribadi',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void _goTo(BuildContext context, String section) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Bagian $section tersedia di halaman ini.')),
    );
  }

  static Widget _sectionTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontSize: 21,
          fontWeight: FontWeight.w800, color: Color(0xFF172554))),
        const SizedBox(height: 3),
        Text(subtitle, style: const TextStyle(color: Color(0xFF64748B))),
      ]),
    );
  }

  static Widget _infoCard({
    required IconData icon, required String title, required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: const Color(0xFF2563EB)),
        ),
        const SizedBox(width: 14),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700,
              color: Color(0xFF172554))),
            const SizedBox(height: 8),
            child,
          ],
        )),
      ]),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) => Chip(
    label: Text(label),
    backgroundColor: const Color(0xFFEFF6FF),
    side: BorderSide.none,
    labelStyle: const TextStyle(color: Color(0xFF1D4ED8),
      fontWeight: FontWeight.w600),
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
  );
}
