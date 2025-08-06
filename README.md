# Flutter Quiz App

A simple and interactive quiz application built with Flutter.

## Features

- Multiple choice questions
- Interactive UI with gradient background
- Score tracking and results summary
- Quiz restart functionality
- Cross-platform support (Android, iOS, Web, Windows)

## Screenshots

[Add screenshots here when available]

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio (for Android development)
- VS Code or Android Studio IDE

### Installation

1. Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/flutter-quiz-app.git
```

2. Navigate to the project directory:

```bash
cd flutter-quiz-app
```

3. Get dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## Building for Different Platforms

### Android

```bash
flutter build apk --release
```

### Web

```bash
flutter build web
```

### Windows

```bash
flutter build windows --release
```

## Project Structure

- `lib/main.dart` - Entry point of the application
- `lib/quiz.dart` - Main quiz logic and screen management
- `lib/start_screen.dart` - Welcome screen
- `lib/questions_screen.dart` - Quiz questions display
- `lib/result_screen.dart` - Results and score display
- `lib/answer_button.dart` - Custom answer button widget
- `lib/questions_summary.dart` - Summary of answered questions
- `lib/data/questions.dart` - Quiz questions data

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- [Add any other acknowledgments]
