# 2024 Fitness Goals Tracker - React Native iOS App

## Overview

The 2024 Fitness Goals Tracker is a personal project designed to track fitness activities throughout the year. This React Native application extends the functionality of the web app to iOS devices, allowing for seamless tracking and data entry on the go. It interfaces with the same backend API, ensuring that all data is synchronized across platforms.

## Features

* **Daily Tracking:** Track daily pull-ups, push-ups, squats, and HSPU.
* **React Native Frontend:** User-friendly mobile interface with secured access via Firebase authentication.
* **Data Persistence:** Uses the same DynamoDB backend for storing records.
* **Cross-Platform:** Sync data between web and mobile applications.
* **Apple Watch Support:** Track fitness activities directly from your Apple Watch.
* **iPad Support:** Track activities across all Apple devices.

![progress_ios.png](screenshots%2Fprogress_ios.png)

![graph_ios.png](screenshots%2Fgraph_ios.png)

![launch_ios.png](screenshots%2Flaunch_ios.png)

![progress_ipad.png](screenshots%2Fprogress_ipad.png)

![graph_ipad.png](screenshots%2Fgraph_ipad.png)

![progress_watch.png](screenshots%2Fprogress_watch.png)

## Setup and Installation

### Prerequisites

* Node.js and npm
* Expo CLI 
* Firebase project configured for iOS 
* AWS backend setup from the [2024_fitness_goals](https://github.com/semperfitodd/2024_fitness_goals) repository
* Xcode for iOS development
* Apple Developer account for deploying the app

### Step-by-Step Guide

1. **Clone the Repository**

    ```bash
    git clone https://github.com/semperfitodd/2024_fitness_goals_ios.git
    cd 2024_fitness_goals_ios
    ```

2. **Install Dependencies**

    ```bash
    npm install
    ```

3. **Configuring OAuth Authentication**

    * Navigate to the Google Cloud Console and create a new project or select an existing one.
    * Enable the "Google Identity Platform" API for your project.
    * Configure the OAuth consent screen with the required information.
    * Create OAuth 2.0 credentials (Client ID and Client Secret) for iOS.
    * Obtain your OAuth 2.0 credentials and add the `GoogleService-Info.plist` file to your project in the `ios` directory.

4. **Running the Application**

    Open the project in Xcode:

    ```bash
    cd ios
    pod install
    open fitnessapp_ios.xcworkspace
    ```

    Build and run the application in the simulator:

    * Select your target device or simulator in Xcode.
    * Click the run button or press `Cmd + R` to build and run the application.

5. **Apple Watch Support**

    To build and run the Apple Watch app, ensure you have the correct configurations in Xcode:

    * Open the `Fitness Tracker Watch` target in Xcode.
    * Ensure the correct provisioning profiles and certificates are selected.
    * Build and run the watch app similarly to the iOS app.

6. **Deploying the Application**

    For deployment, follow the standard procedures for building and deploying React Native apps on iOS:

    * Set up your Apple Developer account.
    * Configure certificates and provisioning profiles in Xcode.
    * Archive the app in Xcode by selecting Product > Archive.
    * Submit the app to the App Store via the Organizer window in Xcode.

## Backend Architecture
The backend architecture is the same as the web app, using AWS services for storage and API management. Below is the architecture diagram for reference:

![2024_fitness_goals_architecture.png](screenshots%2F2024_fitness_goals_architecture.png)