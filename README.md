<!--
Hey, thanks for using the awesome-readme-template template.  
If you have any enhancements, then fork this project and create a pull request 
or just open an issue with the label "enhancement".
Don't forget to give this project a star for additional support ;)
Maybe you can mention me or this repo in the acknowledgements too
-->
<div align="center">
  <h1>Expenses Tracker</h1>
  <p>
    An android/ios mobile app with firebase as backend and flutter framework 
  </p>
  
<!-- Badges -->
<p>
  <a href="https://github.com/JI-Maina/finance_tracker/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/JI-Maina/finance_tracker" alt="contributors" />
  </a>
  <a href="">
    <img src="https://img.shields.io/github/last-commit/JI-Maina/finance_tracker" alt="last update" />
  </a>
  <a href="https://github.com/JI-Maina/finance_tracker/network/members">
    <img src="https://img.shields.io/github/forks/JI-Maina/finance_tracker" alt="forks" />
  </a>
  <a href="https://github.com/JI-Maina/finance_tracker/stargazers">
    <img src="https://img.shields.io/github/stars/JI-Maina/finance_tracker" alt="stars" />
  </a>
  <a href="https://github.com/JI-Maina/finance_tracker/issues/">
    <img src="https://img.shields.io/github/issues/JI-Maina/finance_tracker" alt="open issues" />
  </a>
</p>
   
<h4>
    <a href="https://github.com/JI-Maina/finance_tracker/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/JI-Maina/finance_tracker/issues/">Request Feature</a>
  </h4>
</div>

<br />

<!-- Table of Contents -->
# :notebook_with_decorative_cover: Table of Contents

- [About the Project](#star2-about-the-project)
  * [Tech Stack](#space_invader-tech-stack)
  * [Features](#dart-features)
- [Getting Started](#toolbox-getting-started)
  * [Prerequisites](#bangbang-prerequisites)
  * [Run Locally](#running-run-locally)
- [To-do](#notes-to-do)
- [Contributing](#wave-contributing)
- [License](#warning-license)
- [Contact](#handshake-contact)
- [Acknowledgements](#gem-acknowledgements)


<!-- About the Project -->
## :star2: About the Project
  Mobile App that helps users to track their financial expenses

<!-- TechStack -->
### :space_invader: Tech Stack

<details>
  <summary>App</summary>
  <ul>
    <li><a href="https://flutter.dev/">Flutter</a></li>
    <li><a href="https://bloclibrary.dev">Bloc</a></li>
    <li><a href="https://docs.flutter.dev/ui/design/material">Material Design</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://firebase.google.com/">Firebase</a></li>
  </ul>
</details>

<!-- Features -->
### :dart: Features

- User
  - Create expense category
  - Create an expense
  - Fetch all expense categories
  - Fetch all expenses

<!-- Getting Started -->
## 	:toolbox: Getting Started


<!-- Prerequisites -->
### :bangbang: Prerequisites

This project uses Flutter 3.0.

<!-- Run Locally -->
### :running: Run Locally

Clone the project

```bash
  git clone https://github.com/JI-Maina/finance_tracker.git 
```

Go to the project directory

```bash
  cd project-directory
```

Install dependencies

```bash
  pub get
```

Build the app

```bash
  flutter build apk --split-per-abi
```

Navigate to the build directory and copy the -v7a-release.apk file

```bash
  cd bluid/app/outputs/flutter_apk/
```

Install the app on your phone
