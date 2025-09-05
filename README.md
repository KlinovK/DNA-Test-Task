# iOS Login App with Firebase Authentication
Overview
This project implements a login screen for an iOS application using Swift, Firebase Authentication, Sign in with Apple, and Sign in with Google. After successful authentication, it sends an idToken to a backend API and navigates to a welcome screen. The app follows the MVVM architecture, supports dark mode, and includes error handling and secure token storage.
Features

Authentication: Supports Sign in with Apple and Google via Firebase Auth SDK.
Backend Integration: Sends Firebase idToken to the backend via a JSON-RPC 2.0 POST request.
Token Storage: Stores access token securely in Keychain.
UI: Matches the provided Figma design, with support for light and dark modes.
Error Handling: Manages authentication errors, network issues, and backend response errors.
Architecture: Uses MVVM for clean separation of concerns.

## Setup Instructions
Prerequisites

Xcode: Version 15.0 or later.
iOS: Minimum deployment target iOS 16.0.
Dependencies:
Firebase Auth SDK
GoogleSignIn SDK
Alamofire (for network requests)



## Installation

Clone the Repository:
git clone <repository-url>
cd <project-directory>


Install Dependencies:

The project uses CocoaPods. Ensure CocoaPods is installed (gem install cocoapods).
Run:pod install


Open the .xcworkspace file in Xcode.


## Firebase Setup:

Download the GoogleService-Info.plist file from your Firebase Console.
Add it to the project root in Xcode.
Enable Sign in with Apple in Xcode:
Go to Signing & Capabilities in the target settings.
Add the Sign in with Apple capability.


Configure Google Sign-In:
Follow the Google Sign-In SDK setup to add the required URL schemes to Info.plist.


Build and Run:

Select the target scheme and run the app on a simulator or device.



## Firebase Configuration

Steps:
Create a Firebase project in the Firebase Console.
Add an iOS app to the project and download the GoogleService-Info.plist.
Enable Authentication providers:
Enable Sign in with Apple and Google in the Firebase Console under Authentication > Sign-in method.


Add the Firebase and GoogleSignIn pods to your Podfile:pod 'Firebase/Auth'
pod 'GoogleSignIn'
pod 'Alamofire'


No API keys are required in this README, as they are included in the GoogleService-Info.plist.



## Architecture
The project follows the MVVM (Model-View-ViewModel) architecture:

- Model: Represents data structures (e.g., AuthResponse for backend API responses).
- View: Storyboard-based UI with programmatic constraints for dynamic elements, adhering to the Figma design.
- ViewModel: Handles authentication logic, network requests, and token storage. Communicates with Firebase and the backend API.
- Services: Separate classes for Firebase Auth (AuthService), network requests (NetworkService).
- Error Handling: Centralized error handling in AuthService with user-friendly alerts for authentication and network errors.
- Token Management: Tokens are stored in Keychain for security and retrieved for session persistence.

## Improvements for Production

- Unit Tests: Add unit tests for ViewModels and services using XCTest.
- UI Testing: Implement UI tests to verify navigation and error handling.
- Analytics: Integrate Firebase Analytics to track user interactions.
- Token Refresh: Implement refresh token logic for long-lived sessions.
- Localization: Add support for multiple languages.
- Accessibility: Enhance VoiceOver support and dynamic type scaling.
- Network Retry: Add retry logic for network requests in case of transient failures.
- Custom UI Components: Replace storyboard with SwiftUI or UIKit programmatic views for better maintainability.

## How to Run

Open the .xcworkspace file in Xcode.
Ensure the GoogleService-Info.plist is correctly added.
Build and run the app (Cmd + R).
On the login screen, use the Sign in with Apple or Sign in with Google buttons to authenticate.
Upon successful authentication, the app sends the idToken to the backend, stores the access token, and navigates to the welcome screen.

## Notes

The backend API endpoint (https://api.court360.ai/rpc/client) is hardcoded in NetworkService. Ensure the endpoint is reachable during testing.
Dark mode is supported via system settings and uses color assets with light/dark variants.
The app handles common error cases (e.g., invalid credentials, network failures) with appropriate alerts.
Important: Due to the 3-hour time constraint, full implementation of Sign in with Apple and Sign in with Google was not completed. Proper implementation, including handling edge cases, security considerations, and thorough testing, would require significantly more time (e.g., 6-8 hours) to ensure production-ready quality.

