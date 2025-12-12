import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// --- Models ---
class Project {
  final String title;
  final String description;
  final List<String> features;
  final List<String> screenshots; // Changed from imageUrl
  final String? downloadUrl;

  Project({
    required this.title,
    required this.description,
    required this.features,
    required this.screenshots,
    this.downloadUrl,
  });
}

class Experience {
  final String role;
  final String result; // Company or Degree
  final String duration;
  final String description;

  Experience({
    required this.role,
    required this.result,
    required this.duration,
    required this.description,
  });
}

class Skill {
  final String name;
  final IconData? icon; // Optional icon

  Skill({required this.name, this.icon});
}

class SocialLink {
  final String name;
  final IconData icon;
  final String url;

  SocialLink({required this.name, required this.icon, required this.url});
}

class PortfolioData {
  // Profile
  static const String name = "Bayan Mansour";
  static const String title = "Software Engineer | Flutter Developer";
  static const String location = "Damascus, Syria";
  static const String email = "bayannmansourr01@gmail.com";
  static const String phone = "+963934919807";

  static const String avatarUrl = "assets/images/myPhoto.jpg";

  static const String summary =
      "Passionate Software Engineer with a strong focus on scalable Flutter architectures and cross-platform solutions. "
      "Dedicated to building robust mobile ecosystems, from hyper-local logistics to complex educational platforms. "
      "Skilled in Clean Architecture, state management, and seamless backend integration.";

  // Socials
  static final List<SocialLink> socials = [
    SocialLink(
      name: "LinkedIn",
      icon: FontAwesomeIcons.linkedinIn,
      url: "https://linkedin.com/in/bayan-mansour",
    ),
    SocialLink(
      name: "GitHub",
      icon: FontAwesomeIcons.github,
      url: "https://github.com/BayannMansour01",
    ),
    SocialLink(
      name: "GitLab",
      icon: FontAwesomeIcons.gitlab,
      url: "https://gitlab.com/BayannMansour",
    ), // Add correct GitLab URL if known, assuming standard pattern or placeholder
    SocialLink(
      name: "Email",
      icon: FontAwesomeIcons.envelope,
      url: "mailto:$email",
    ),
    SocialLink(name: "Phone", icon: FontAwesomeIcons.phone, url: "tel:$phone"),
  ];

  // Experience
  static final List<Experience> experiences = [
    Experience(
      role: "Flutter Developer",
      result: "Sunrise IT Company",
      duration: "12/2024 – Present",
      description:
          "Key developer for enterprise mobile solutions, implementing scalable features with Clean Architecture. "
          "Specialized in integrating complex REST APIs, local databases, and interactive UI components (Lottie/Rive) within a collaborative Agile environment.",
    ),
  ];

  // Education
  static final Experience education = Experience(
    role: "Bachelor's Degree in Software Engineering",
    result: "Damascus University",
    duration: "2019 – 2024",
    description: "",
  );

  // Projects
  static final List<Project> projects = [
    Project(
      title: "LosGo App (Germany)",
      description:
          "A hyper-local logistics and mobility platform connecting users with vetted drivers for on-demand transport and parcel delivery. Features real-time tracking and secure payments, streamlining complex logistics into a seamless mobile experience.",
      features: [
        "Real-Time Tracking: Precise live tracking with Google Maps & Geodesy, featuring dynamic routing and accurate ETAs.",
        "Secure Digital Wallet: Integrated Stripe for a secure wallet supporting instant top-ups, transactions, and automated payouts.",
        "In-App Messaging: Built a chat system with text, images, and AAC voice notes for seamless user-driver coordination.",
        "Dynamic Localization: Scalable English/Arabic (RTL) support with dynamic theming for a culturally optimized experience.",
        "Smart Offer System: Competitive bidding engine allowing users to broadcast requests and select from real-time driver offers.",
      ],
      screenshots: [
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=LosGo+Login",
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=LosGo+Home",
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=LosGo+Map",
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=LosGo+Profile",
      ],
      // downloadUrl: "https://example.com/losgo",
    ),
    Project(
      title: "Arabic Academic App (Syria)",
      description:
          "A cross-platform e-learning ecosystem empowering teachers and students with video lectures, assessments, and real-time collaboration. Bridges the remote education gap through offline capabilities and a robust assessment engine.",
      features: [
        "Real-time Communication: Low-latency chat via Socket.IO/WebSockets with deep-linked local notifications for instant updates.",
        "Offline Media Engine: Resilient download manager using Dio & FFmpeg to mux audio/video streams for high-quality offline playback.",
        "Dynamic Assessments: Comprehensive testing suite with real-time scoring and performance tracking, managed by reactive state.",
        "Role-Based Access (RBAC): Secure, distinct navigation for Students & Teachers using GetX Middleware for permission management.",
        "Optimized Resource Management: Efficient local caching (Hive/SharedPrefs) to persist sessions and progress, reducing API load.",
      ],
      screenshots: [
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=Academic+Home",
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=Video+Player",
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=Chat+Room",
      ],
      downloadUrl: "https://example.com/losgo",
    ),
    Project(
      title: "Daleelie App",
      description:
          "A digital marketplace and directory unifying service providers, job seekers, and exhibitions. Streamlines local classifieds and event discovery into a single ecosystem with advanced listing management and interactive showcases.",
      features: [
        "Advanced Classifieds Engine: Scalable listing system with dynamic fields and multi-category filtering for complex data processing.",
        "Interactive Exhibition Hub: Dedicated module for virtual exhibitions, aggregating event galleries to enhance engagement.",
        "Geo-Location Integration: Google Maps integration with clustering and radius search for visual discovery of local listings.",
        "Clean Architecture: Rigid separation of Domain, Data, and Presentation layers ensuring maintainability and scalability.",
        "Global Search: High-performance aggregated search across companies, classifieds, and jobs using optimized API queries.",
      ],
      screenshots: [
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=Daleelie+Home",
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=Ad+Listing",
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=Exhibitions",
      ],

      downloadUrl: "https://example.com/losgo",
    ),
    Project(
      title: "Modern Syrian School App",
      description:
          "A robust School Management System acting as a digital liaison for parents and administration. Handles complex academic data and real-time tracking within a secure, scalable, and bilingual interface.",
      features: [
        "Clean Architecture: Modular, testable codebase separating layers to ensure scalability and easy maintenance.",
        "Smart Communication Center: Centralized inbox with advanced filtering and attachments, acting as a unified digital noticeboard.",
        "Secure Authentication: Robust JWT flow with token refreshing and secure storage for persistent, safe sessions.",
        "Academic Dashboard: Dynamic GetX-based UI for visualizing student data, grades, and schedules seamlessly.",
        "Optimized UX: Integrated Skeletonizer and flutter_screenutil for pixel-perfect responsiveness and smooth loading states.",
      ],
      screenshots: [
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=School+Dash",
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=Attendance",
        "https://via.placeholder.com/1080x1920/1a1a1a/FFFFFF?text=Tracking",
      ],
      downloadUrl: "https://example.com/losgo",
    ),
  ];

  // Skills
  static final List<Skill> techSkills = [
    Skill(name: "Flutter & Dart", icon: FontAwesomeIcons.flutter),
    Skill(
      name: "Clean Architecture & SOLID",
      icon: FontAwesomeIcons.layerGroup,
    ),
    Skill(
      name: "State Management (GetX, BLoC, Cubit, Provider)",
      icon: FontAwesomeIcons.arrowsSpin,
    ),
    Skill(
      name: "Networking (Dio, REST APIs, WebSockets, Socket.IO)",
      icon: FontAwesomeIcons.networkWired,
    ),
    Skill(
      name: "Local Storage (Hive, SQLite, Shared Preferences)",
      icon: FontAwesomeIcons.database,
    ),
    Skill(
      name: "Maps & Location (Google Maps, Geodesy)",
      icon: FontAwesomeIcons.mapLocationDot,
    ),
    Skill(
      name: "Payment Integration (Stripe)",
      icon: FontAwesomeIcons.creditCard,
    ),
    Skill(
      name: "Multimedia (FFmpeg, Audio/Video Players)",
      icon: FontAwesomeIcons.photoFilm,
    ),
    Skill(
      name: "Notifications (FCM, Local Notifications)",
      icon: FontAwesomeIcons.bell,
    ),
    Skill(name: "Tools (Git, Figma, Postman)", icon: FontAwesomeIcons.toolbox),
  ];

  static final List<String> softSkills = [
    "Quick Learning",
    "Problem Solving",
    "Team Collaboration",
  ];

  static final List<String> languages = ["Arabic (Native)", "English (B2)"];
}
