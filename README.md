<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/yagoquesada/radio_app">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">project_title</h3>

  <p align="center">
    project_description
    <br />
    <a href="https://github.com/yagoquesada/radio_app"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/yagoquesada/radio_app">View Demo</a>
    ·
    <a href="https://github.com/yagoquesada/radio_app/issues">Report Bug</a>
    ·
    <a href="https://github.com/yagoquesada/radio_app/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

Here's a blank template to get started: To avoid retyping too much info. Do a search and replace with your text editor for the following: `github_username`, `repo_name`, `twitter_handle`, `linkedin_username`, `email_client`, `email`, `project_title`, `project_description`

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Next][Next.js]][Next-url]
* [![React][React.js]][React-url]
* [![Vue][Vue.js]][Vue-url]
* [![Angular][Angular.io]][Angular-url]
* [![Svelte][Svelte.dev]][Svelte-url]
* [![Laravel][Laravel.com]][Laravel-url]
* [![Bootstrap][Bootstrap.com]][Bootstrap-url]
* [![JQuery][JQuery.com]][JQuery-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   git clone https://github.com/yagoquesada/radio_app.git
   ```
3. Install NPM packages
   ```sh
   npm install
   ```
4. Enter your API in `config.js`
   ```js
   const API_KEY = 'ENTER YOUR API';
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] Feature 1
- [ ] Feature 2
- [ ] Feature 3
    - [ ] Nested Feature

See the [open issues](https://github.com/yagoquesada/radio_app/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - email@email_client.com

Project Link: [https://github.com/yagoquesada/radio_app](https://github.com/yagoquesada/radio_app)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->




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

> [!WARNING] 
> The API used has limited requests when using the free plan, so unless you have a paid subscription to the API, you will get an error screen inside the app.

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
