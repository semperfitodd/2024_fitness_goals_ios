# 2024 Fitness Goals Tracker - React Native iOS App

## Overview

The 2024 Fitness Goals Tracker is a personal project designed to track fitness activities throughout the year. This React Native application extends the functionality of the web app to iOS devices, allowing for seamless tracking and data entry on the go. It interfaces with the same backend API, ensuring that all data is synchronized across platforms.

## Features

* **Daily Tracking:** Track daily pull-ups, push-ups, squats, and HSPU.
* **React Native Frontend:** User-friendly mobile interface with secured access via Firebase authentication.
* **Data Persistence:** Uses the same DynamoDB backend for storing records.
* **Cross-Platform:** Sync data between web and mobile applications.

## Setup and Installation
### Prerequisites
* Node.js and npm or yarn 
* Expo CLI 
* Firebase project configured for iOS 
* AWS backend setup from the [2024_fitness_goals](https://github.com/semperfitodd/2024_fitness_goals) repository
## Step-by-Step Guide
1. Clone the Repository
    ```bash
    git clone https://github.com/semperfitodd/2024_fitness_goals_ios.git
    cd 2024_fitness_goals_ios
    ```
2. Install Dependencies
    ```bash
    npm install
    ```
3. Configuring OAuth Authentication

   * Navigate to the Google Cloud Console and create a new project or select an existing one.
   * Enable the "Google Identity Platform" API for your project.
   * Configure the OAuth consent screen with the required information.
   * Create OAuth 2.0 credentials (Client ID and Client Secret) for iOS.
   * Obtain your OAuth 2.0 credentials and add the `GoogleService-Info.plist` file to your project.

4. Running the Application
    Open in xcode
    ```bash
    open ios/fitnessapp_ios.xcworkspace
    ```
   Build and run simulator.

5. Deploying the Application
For deployment, follow the standard procedures for building and deploying React Native apps on iOS. This involves setting up your Apple Developer account, configuring certificates and provisioning profiles, and submitting the app to the App Store.

