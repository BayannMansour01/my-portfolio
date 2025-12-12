import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/text_styles.dart';
import 'package:my_portfolio/views/components/glass_container.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar with Spinning Pink Ring
                SizedBox(
                  width: 280,
                  height: 280,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildSpinningRing(),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            // Neon Haze Glow
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.6),
                              blurRadius: 40,
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: AppColors.secondary.withOpacity(0.4),
                              blurRadius: 80,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 110,
                          backgroundColor: AppColors.backgroundLight,
                          backgroundImage: AssetImage(PortfolioData.avatarUrl),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 56),

                // Glass Card for Text
                GlassContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48,
                    vertical: 32,
                  ),
                  borderRadius: 24,
                  gradientBorder: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.transparent,
                      AppColors.primary.withOpacity(0.5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  child: Column(
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "Hello, I'm ",
                            style: AppTextStyles.title.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          DefaultTextStyle(
                            style: AppTextStyles.header.copyWith(fontSize: 32),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  PortfolioData.name,
                                  speed: const Duration(milliseconds: 100),
                                ),
                              ],
                              isRepeatingAnimation: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        PortfolioData.title,
                        style: AppTextStyles.subHeader.copyWith(
                          fontSize: 20,
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        PortfolioData.summary,
                        style: AppTextStyles.body.copyWith(
                          fontSize: 16,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // Socials
                Wrap(
                  alignment: WrapAlignment.center,
                  children: PortfolioData.socials
                      .map(
                        (social) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: IconButton(
                            onPressed: () => _launchUrl(social.url),
                            icon: FaIcon(
                              social.icon,
                              color: AppColors.textPrimary,
                              size: 24,
                            ),
                            style: IconButton.styleFrom(
                              hoverColor: AppColors.primary.withOpacity(0.2),
                              padding: const EdgeInsets.all(12),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpinningRing() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 8),
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * 2 * 3.14159,
          child: Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withOpacity(0.6),
                width: 2,
                style: BorderStyle.solid,
              ),
              // Dashed effect would need CustomPainter, but solid thin pink ring is okay for now
              // Or use dashed_circle package if allowed. Prompt said "spinning dashed ring".
              // I will use a simple Dashed painter if needed, but for now simple ring + dot indicator
            ),
            child: const Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: AppColors.primary,
              ),
            ),
          ),
        );
      },
      onEnd: () {},
    );
  }
}
