# Radio App

A Flutter Radio App 📻.

## Table of Contents
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Features](#features)

## Getting Started

### Prerequisites

List any software or dependencies that users need to have installed before they can use your project. For example:

- Flutter: [Installation Guide](https://flutter.dev/docs/get-started/install)

### Installation

Provide step-by-step instructions on how users can install and set up your project. Include any necessary commands or configurations. For example:

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-project.git
2. Change to the project directory
   ```bash
   cd your-project
3. Install dependencies
   ```bash
   flutter pub get
   
## Usage
First of all go to YOUR_API_KEY inside [constants.dart](https://github.com/yagoquesada/radio_app/blob/main/lib/core/constants/constants.dart)

Then you are ready to run it!
  ```bash
  flutter run
  ```

## Features

### 1. Home Screen with Radio Stations

- **Description:** The app features a home screen displaying a list of radio stations.
- **Functionality:**
  - View a list of radio stations.
  - Filter stations by genre.
  - Intuitive user interface for easy navigation.

### 2. Radio Player Screen

- **Description:** Navigate to a detailed screen for each radio station selected from the home screen.
- **Functionality:**
  - Display station details (e.g., name, genre, song name).
  - Controls for playback:
    - Play/Pause: Start or pause the station stream.
    - Volume Control: Adjust the volume of the streaming audio.
    - Previous Station: Navigate to the previous radio station in the list.
    - Next Station: Navigate to the next radio station in the list.
    - Refresh: Reload the current station for an updated stream.

### 3. Responsive User Interface

- **Description:** The app provides a responsive and user-friendly interface.
- **Functionality:**
  - Ensures a seamless user experience across different devices and screen sizes.

### 4. Genre Filtering

- **Description:** Enhance user experience by allowing the filtering of radio stations based on genres.
- **Functionality:**
  - Easily switch between different genres to discover stations of interest.

### 5. Stream Handling

- **Description:** Efficient handling of radio stream playback.
- **Functionality:**
  - Seamless transition between stations.
  - Robust error handling and user feedback for stream-related issues.

### 6. Intuitive Controls

- **Description:** User-friendly controls for managing the radio playback.
- **Functionality:**
  - Easy-to-use play, pause, volume, and navigation controls.

### 7. Station Information

- **Description:** Provide relevant information about the currently playing radio station.
- **Functionality:**
  - Display station name, logo, and additional details.
