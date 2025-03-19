import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BadgesView extends StatelessWidget {
  const BadgesView({super.key});

  Widget _buildBadgeIcon(IconData icon, bool isUnlocked, Color accentColor) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isUnlocked ? accentColor.withOpacity(0.3) : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: isUnlocked ? accentColor.withOpacity(0.2) : Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          if (isUnlocked) ...[
            // Alt parlaklık efekti
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: RadialGradient(
                    colors: [
                      accentColor.withOpacity(0.2),
                      Colors.transparent,
                    ],
                    center: Alignment.center,
                    radius: 0.8,
                  ),
                ),
              ),
            ),
          ],
          // İkon
          Center(
            child: Icon(
              icon,
              color: isUnlocked ? accentColor : Colors.grey[600],
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String title, String subtitle, String target, IconData icon, bool isUnlocked, Color accentColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isUnlocked ? accentColor.withOpacity(0.3) : Colors.transparent,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  _buildBadgeIcon(icon, isUnlocked, accentColor),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: isUnlocked ? accentColor : Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isUnlocked ? accentColor.withOpacity(0.2) : Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                target,
                style: TextStyle(
                  color: isUnlocked ? accentColor : Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1C2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1C2E),
        title: const Text(
          "Meydan Okumalar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          _buildCategoryTitle("Genel Kullanım Rozetleri"),
          _buildBadge(
            "Hoş Geldin!",
            "Uygulamaya ilk kez giriş yap",
            "0/1",
            FontAwesomeIcons.gift,
            false,
            Colors.purple,
          ),
          _buildBadge(
            "Düzenli Çalışan",
            "Art arda 7 gün boyunca uygulamayı kullan",
            "0/7",
            FontAwesomeIcons.calendar,
            false,
            Colors.blue,
          ),
          _buildBadge(
            "Bağımlı mı Ne?",
            "30 gün boyunca her gün giriş yap",
            "0/30",
            FontAwesomeIcons.fire,
            false,
            Colors.orange,
          ),
          _buildBadge(
            "Sadakat Ustası",
            "90 gün boyunca her gün giriş yap",
            "0/90",
            FontAwesomeIcons.medal,
            false,
            Colors.amber,
          ),
          _buildBadge(
            "Azmin Zaferi",
            "180 gün boyunca her gün giriş yap",
            "0/180",
            FontAwesomeIcons.trophy,
            false,
            Colors.yellow,
          ),
          _buildBadge(
            "Efsane",
            "360 gün boyunca her gün giriş yap",
            "0/360",
            FontAwesomeIcons.crown,
            false,
            Colors.purple,
          ),

          _buildCategoryTitle("Hedeflerim Rozetleri"),
          _buildBadge(
            "Hedef Koyucu",
            "10 kere hedef ekle",
            "0/10",
            FontAwesomeIcons.bullseye,
            false,
            Colors.red,
          ),
          _buildBadge(
            "Planlama Ustası",
            "50 kere hedef ekle",
            "0/50",
            FontAwesomeIcons.calendar,
            false,
            Colors.blue,
          ),
          _buildBadge(
            "Geleceği Şekillendiren",
            "100 kere hedef ekle",
            "0/100",
            FontAwesomeIcons.trophy,
            false,
            Colors.amber,
          ),

          _buildCategoryTitle("Süre Bazlı Rozetler"),
          _buildBadge(
            "Dayanıklılık Ustası",
            "Tek seferde 2 saat çalış",
            "0/2",
            FontAwesomeIcons.personRunning,
            false,
            Colors.green,
          ),
          _buildBadge(
            "Maratoncu",
            "Toplam 50 saat çalışma süresine ulaş",
            "0/50",
            FontAwesomeIcons.medal,
            false,
            Colors.amber,
          ),
          _buildBadge(
            "Demir İrade",
            "Toplam 100 saat çalışma süresine ulaş",
            "0/100",
            FontAwesomeIcons.medal,
            false,
            Colors.pink,
          ),
          _buildBadge(
            "Çalışma Canavarı",
            "Toplam 200 saat çalışma süresine ulaş",
            "0/200",
            FontAwesomeIcons.trophy,
            false,
            Colors.purple,
          ),

          _buildCategoryTitle("Yapılacaklar Rozetleri"),
          _buildBadge(
            "Planlı Öğrenci",
            "10 kere yapılacaklara görev ekle",
            "0/10",
            FontAwesomeIcons.clipboard,
            false,
            Colors.blue,
          ),
          _buildBadge(
            "Organizasyon Ustası",
            "50 kere yapılacaklara görev ekle",
            "0/50",
            FontAwesomeIcons.clipboardList,
            false,
            Colors.green,
          ),
          _buildBadge(
            "Görev Canavarı",
            "100 kere yapılacaklara görev ekle",
            "0/100",
            FontAwesomeIcons.rocket,
            false,
            Colors.orange,
          ),

          _buildCategoryTitle("Özel Rozetler"),
          _buildBadge(
            "Gece Baykuşu",
            "Gece 02:00'den sonra test çöz",
            "0/1",
            FontAwesomeIcons.moon,
            false,
            Colors.indigo,
          ),
          _buildBadge(
            "Sabahın Körü",
            "Sabah 05:00'ten önce test çöz",
            "0/1",
            FontAwesomeIcons.sun,
            false,
            Colors.orange,
          ),
        ],
      ),
    );
  }
}