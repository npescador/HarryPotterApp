# HarryPotterApp

An application for consulting movies, movie characters, books, potions, and enchantments from the Harry Potter world.

The project intends to follow the Clean architecture, adding the necessary layers for complete decoupling.

## Architecture Layers:

- **Presentation Layer:** Contains the UI views and ViewModels.

- **Domain Layer:** Contains the business logic.

- **Data Layer:** Contains data sources, repositories, API communication, and services.

- **Dependency Injection:** Uses a custom class (coordinator) for handling dependency injection.

## Implemented Functionalities:

- **UserDefaults:** For checking if the user has logged in with his user and perform the loading of the main view or the authentication view and to store the movies marked as favorites.

- **Firebase Auth:** To perform user registration and authentication.

- **KingFisher:** For remote image loading.

- **URLSession:** For network requests.

- **YouTubePlayerKit:** For YouTube video playback.

- **ActivityKit:** For the use of the Dynamic Island.

## Folder Structure:

- **common:** Contains the class to handle bookmark bookmarks.

- **components:** Contains the custom views created for image loading and for the main menu buttons.

- **data:** Contains the repositories and services implementation.

- **Entities:** Contains the different data models used in the application.

- **Extensions:** Contains extension classes of other classes.

- **Features:** Contains all the views and viewmodels of the application.

- **NetworkClient:** Contains a custom network client.

- **Resources:** Contains the files for the translation of the texts in English and Spanish languages.