import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/text_styles.dart';
import 'package:my_portfolio/views/components/mouse_glow.dart';
import 'package:my_portfolio/views/sections/hero_section.dart';
import 'package:my_portfolio/views/sections/skills_section.dart';
import 'package:my_portfolio/views/sections/projects_section.dart';
import 'package:my_portfolio/views/sections/experience_section.dart';
import 'package:my_portfolio/views/components/parallax_background.dart';
import 'package:my_portfolio/views/components/glass_container.dart';
import 'package:my_portfolio/views/sections/languages_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bayan Mansour',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.backgroundLight,
          background: AppColors.background,
        ),
        textTheme:
            GoogleFonts.jetBrainsMonoTextTheme(
              Theme.of(context).textTheme,
            ).apply(
              bodyColor: AppColors.textPrimary,
              displayColor: AppColors.textPrimary,
            ),
        useMaterial3: true,
      ),
      home: const ScrollyPortfolioHome(),
    );
  }
}

class ScrollyPortfolioHome extends StatefulWidget {
  const ScrollyPortfolioHome({super.key});

  @override
  State<ScrollyPortfolioHome> createState() => _ScrollyPortfolioHomeState();
}

class _ScrollyPortfolioHomeState extends State<ScrollyPortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutCubicEmphasized,
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      endDrawer: Drawer(
        backgroundColor: AppColors.backgroundLight,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.background),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(PortfolioData.avatarUrl),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    PortfolioData.name,
                    style: AppTextStyles.title.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: AppColors.primary),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_heroKey);
              },
            ),
            ListTile(
              leading: const Icon(Icons.work, color: AppColors.primary),
              title: const Text("Projects"),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_projectsKey);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history_edu, color: AppColors.primary),
              title: const Text("Experience"),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_experienceKey);
              },
            ),
            ListTile(
              leading: const Icon(Icons.code, color: AppColors.primary),
              title: const Text("Skills"),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_skillsKey);
              },
            ),
          ],
        ),
      ),
      body: MouseGlow(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 800;

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                // Background Layer
                Positioned.fill(
                  child: ParallaxBackground(
                    scrollController: _scrollController,
                  ),
                ),

                // 1. Main Scroll View
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    // Top Padding to prevent content from being hidden behind the top navbar
                    const SliverPadding(padding: EdgeInsets.only(top: 100)),

                    SliverToBoxAdapter(
                      key: _heroKey,
                      child: const HeroSection(),
                    ),

                    // Big Spacer
                    const SliverToBoxAdapter(child: SizedBox(height: 80)),

                    SliverToBoxAdapter(
                      key: _projectsKey,
                      child: const ProjectsSection(),
                    ),

                    // Big Spacer
                    const SliverToBoxAdapter(child: SizedBox(height: 80)),

                    SliverToBoxAdapter(
                      key: _experienceKey,
                      child: const ExperienceSection(),
                    ),

                    // Big Spacer
                    const SliverToBoxAdapter(child: SizedBox(height: 80)),

                    SliverToBoxAdapter(
                      key: _skillsKey,
                      child: const SkillsSection(),
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 80)),

                    const SliverToBoxAdapter(child: LanguagesSection()),
                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                ),

                // 2. Navigation Dock (Positioned correctly inside Stack)
                Positioned(
                  top: isMobile ? 20 : 30,
                  right: isMobile ? 20 : 50,
                  child: isMobile
                      ? GlassContainer(
                          padding: const EdgeInsets.all(12),
                          borderRadius: 12,
                          color: Colors.white.withOpacity(0.1),
                          child: IconButton(
                            icon: const Icon(
                              Icons.menu_rounded,
                              color: AppColors.textPrimary,
                            ),
                            onPressed: () =>
                                _scaffoldKey.currentState?.openEndDrawer(),
                          ),
                        )
                      : _buildGlassDock(context),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildGlassDock(BuildContext context) {
    return GlassContainer(
      blur: 20,
      borderRadius: 30, // Capsule
      color: Colors.white.withOpacity(0.05), // Subtle tint
      gradientBorder: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.transparent,
          AppColors.primary,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _NavBarItem(
            label: "Home",
            onPressed: () => _scrollToSection(_heroKey),
          ),
          const SizedBox(width: 32),
          _NavBarItem(
            label: "Projects",
            onPressed: () => _scrollToSection(_projectsKey),
          ),
          const SizedBox(width: 32),
          _NavBarItem(
            label: "Experience",
            onPressed: () => _scrollToSection(_experienceKey),
          ),
          const SizedBox(width: 32),
          _NavBarItem(
            label: "Skills",
            onPressed: () => _scrollToSection(_skillsKey),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const _NavBarItem({required this.label, required this.onPressed});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label.toUpperCase(),
              style: GoogleFonts.jetBrainsMono(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: _isHovered ? AppColors.primary : AppColors.textPrimary,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 4),
            // Pink Dot/Underline
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: _isHovered ? 20 : 0,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  if (_isHovered)
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.6),
                      blurRadius: 4,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
