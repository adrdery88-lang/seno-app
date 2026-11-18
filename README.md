# 🎓 Seno — English Learning Mobile Application

> **Speak the World. One Word at a Time.**

**Seno** is an AI-powered, cross-platform English Learning mobile application developed with **Flutter** (targeting Android & iOS). Designed with a **Dark-First**, gamified yet professional aesthetic, Seno integrates advanced speech evaluation, Spaced Repetition (SM-2), AI roleplay chat personas, AR camera object recognition, and context shadowing into a unified learning experience.

---

## 📱 App Highlights & Architecture

### 1. Multi-Level CEFR Curriculum
- **Absolute Beginner (Pre-A1):** Alphabet, Phonics, Basic Greetings, Numbers & Colors.
- **Elementary (A1-A2):** Daily Conversations, Essential Grammar, Present & Past Tenses.
- **Intermediate (B1-B2):** Workplace English, Idioms, Phrasal Verbs & Listening Comprehension.
- **Advanced & Mastery (C1-C2):** Business Negotiations, Academic Writing, Native Nuances & Debate.

### 2. Core Intelligent Features
- **Dual TTS Engine:** Switch seamlessly between American (US 🇺🇸) and British (UK 🇬🇧) native pronunciations with speed toggles (`1.0x` and `0.6x`).
- **AI Speech Coach (STT):** Syllable-by-syllable real-time phonetic analysis, color-coded accuracy breakdown (Green/Yellow/Red), and actionable correction tips.
- **Smart Word Vault (SRS):** One-tap vocabulary saving with automated review intervals powered by the **SuperMemo-2 (SM-2)** Spaced Repetition Algorithm.
- **Interactive Mini-Games:**
  - **Word Rush:** 60-second speed matching game.
  - **Sentence Builder:** Drag-and-drop grammatical syntax puzzles.
  - **Voice Escape:** Speak phrases accurately (>= 75%) to unlock doors and escape.
- **AI Roleplay Personas:** Voice & text simulation with adaptive AI characters:
  - *Officer Rivera* (Airport Customs)
  - *Maya* (Coffee Shop Barista)
  - *Sarah Chen* (Tech Hiring Manager / Job Interview)
  - *James Mitchell* (Commercial Contract Negotiation)
- **AR Snap & Learn:** Point phone camera at real-world objects, identify them in English with phonetics, and launch an instant mini-quiz.
- **Context Shadowing Mode:** Split-screen audio player with visual waveform rhythm and intonation comparison against native speakers.

---

## 🗂️ Project Structure

```
d:\Eng-L/
├── pubspec.yaml                      # Project dependencies & assets configuration
├── analysis_options.yaml             # Dart linting & analyzer rules
├── PLAN.md                           # Detailed architectural blueprint
├── assets/
│   └── content/
│       ├── levels/levels.json        # Preloaded CEFR curriculum levels
│       ├── personas/personas.json    # AI Roleplay character templates
│       └── quizzes/assessment_quiz.json # 60-second level assessment quiz
└── lib/
    ├── main.dart                     # App entry point
    ├── app.dart                      # SenoApp root & dark/light theme config
    ├── injection.dart                # Dependency injection setup (GetIt)
    ├── core/
    │   ├── constants/                # Colors, Typography, Dimensions, Endpoints
    │   ├── errors/                   # Failure & Exception classes
    │   ├── network/                  # Network connectivity & API client
    │   ├── router/                   # GoRouter & 25+ app routes
    │   ├── theme/                    # Seno Dark & Light design system
    │   ├── utils/                    # SM-2 algorithm, XP calculator, Date utils
    │   └── widgets/                  # Progress rings, badges, waveforms, buttons
    └── features/
        ├── splash/                   # Animated 3-phase logo intro
        ├── onboarding/               # Welcome, 60s level assessment & profile setup
        ├── auth/                     # Sign In, Sign Up & Social Auth
        ├── home/                     # Dashboard, streak header, XP, radar & scenarios
        ├── curriculum/               # Path browser, level details & lesson screens
        ├── pronunciation/            # AI speech coach, TTS, STT & syllable analysis
        ├── word_vault/               # Saved vocabulary bank & SM-2 flashcard reviews
        ├── games/                    # Word Rush, Sentence Builder & Voice Escape
        ├── ai_roleplay/              # Persona roster & interactive voice chat
        ├── snap_learn/               # Camera object scanner & instant quiz
        ├── shadowing/                # Dual waveform intonation comparison
        ├── leaderboard/              # Weekly XP ranking & podium
        └── profile/                  # User stats, settings & achievement badges
```

---

## 🚀 Getting Started

### Prerequisites
1. [Flutter SDK](https://flutter.dev/docs/get-started/install) (`>= 3.2.0`)
2. Android Studio / Xcode for mobile emulation and physical device testing.

### Setup & Run
```bash
# 1. Install dependencies
flutter pub get

# 2. Run code generation (if using freezed / isar generators)
dart run build_runner build --delete-conflicting-outputs

# 3. Launch on connected device or simulator
flutter run
```
