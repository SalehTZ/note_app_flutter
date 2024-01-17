# Flutter Note Application

## Overview

Welcome to the Flutter Note Application! This project is a note-taking application developed using the Flutter framework, with Hive serving as the database. The application empowers users to effortlessly create, delete, and edit notes, providing a seamless and efficient note-taking experience.

## Screenshots

### Main Screen
  
![screenshot 1](/screenshot/main_screen_resized.jpg) ![screenshot 2](/screenshot/main_screen2_resized.jpg)

### New Note Screen:
![screenshot 3](/screenshot/new_note1_resized.jpg) ![screenshot 4](/screenshot/new_note_resized.jpg)

### Show Note Screen:
![screenshot 5](/screenshot/show_note_screen_resized.jpg)

## Project Description

### Introduction

The Flutter Note Application is a mobile app designed to simplify the process of taking and managing notes. Built with the Flutter framework, it offers a cross-platform solution for users who seek a quick and intuitive note-taking experience. The utilization of Hive as the database ensures efficient data storage and retrieval.


### Usage

To run this Application, follow these steps:

1. Install Flutter and Dart on your development environment.
2. Clone the repository and navigate to the project directory.
3. Run `flutter pub get` to install the dependencies.
4. Execute `flutter run` to launch the application on your preferred emulator or physical device.

### Files and Directory Structure

- **`lib/main.dart`**: The entry point of the application, containing the main functionality for handling notes, navigation, and UI components.

- **`lib/constants/`**: The `constants` folder serves as a centralized location for managing various aspects of the Flutter Note Application. It contains several manager classes, each responsible for specific functionalities:

    - **`colors_manager.dart`**: The colors manager class is responsible for defining and managing the color palette used throughout the application. This ensures consistency in the visual representation of different UI elements.

    - **`fonts_manager.dart`**: Font styles and configurations are managed by the `fonts_manager.dart` class. It facilitates the easy integration and customization of fonts, ensuring a cohesive and visually appealing typography across the app.

    - **`styles_manager.dart`**: The styles manager class handles the definition of various styles used in the application, such as text styles, button styles, and container styles. This promotes a standardized and maintainable approach to UI styling.

    - **`theme_manager.dart`**: The theme manager class oversees the overall theme configuration for the application. It includes settings for both light and dark modes, allowing users to personalize their note-taking experience.

        #### Considerations for Customization

        Each manager class in the `constants` folder is designed with customization in mind. Users can tailor the application's look and feel by modifying relevant parameters in these manager classes. For example, changing colors, fonts, or styles can be easily accomplished by adjusting the corresponding values within the respective manager classes.

        Feel free to explore and modify these manager classes to suit your preferences. The well-documented code and clear organization aim to facilitate a smooth customization process.

        #### Usage Example

        To demonstrate how to leverage these manager classes, here's a quick example:

        ```dart
        // Import the managers
        import 'constants/colors_manager.dart';
        import 'constants/styles_manager.dart';
        import 'constants/theme_manager.dart';

        // Use predefined colors
        Color primaryColor = ColorsManager.primaryColor;

        // Apply custom font styles
        TextStyle regularStyle = TextStyles.getRegularStyle();

        // Switch between light and dark themes
        ThemeData currentTheme = getApplicationTheme();
        ```

- **`lib/screens/`**: The `screens` folder is the heart of the Flutter Note Application, housing the code for various screens that make up the user interface. Each screen plays a crucial role in delivering a seamless and intuitive note-taking experience. Here's an overview of the screens included in this folder:

    - **`home_screen.dart`**: The home screen is the main screen users encounter upon launching the application. It provides an overview of existing notes, quick access to note creation, and essential navigation features. Home Screen uses `notes_screen.dart` to show saved notes in the Home Screen.

    - **`show_notes_screen.dart`**: This screen is dedicated to displaying the details of a specific note. Users can view individual notes.

    - **`edit_note_screen.dart`**: The *edit note screen* offers users the ability to edit notes and provides options to save or discard changes.

    - **`new_note_screen.dart`**: This screen is designed to provide a straightforward and efficient interface for users to compose and save their thoughts.



- **`lib/model/`**: This directory is dedicated to housing data models utilized for creating objects in the `Hive` database. These models play a crucial role in ensuring structured and organized storage of note information within the application.


#### Why Hive Database ?

The decision to use [Hive](https://pub.dev/packages/hive) as the database was influenced by its read/write speed and simplicity in mobile applications. Hive's lightweight and fast storage mechanism aligns well with the goal of providing a responsive note-taking experience.

- [see benchmarks](https://blog.logrocket.com/comparing-hive-other-flutter-app-database-options/#benchmark-result)

### Future Improvements

While the Flutter Note Application is currently functional and user-friendly, there are avenues for improvement. Future enhancements may include cloud synchronization, additional note customization options, TODO lists and more noting options.

Feel free to explore the codebase, experiment with different configurations, and contribute to the project's development. If you encounter any issues or have suggestions, please create an issue in the [GitHub repository](https://github.com/SalehTZ/note_app_flutter). Your feedback is invaluable!
