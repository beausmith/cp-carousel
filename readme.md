# Carousel Prototype

Homework for CodePath, [Week 2 Project: Carousel](http://courses.codepath.com/courses/ios_for_designers/unit/2#!assignment)

## Summary
* This project took about **10 hours** to complete, over 3 sessions.
* **All required** steps are complete.
* **Some optional** steps are complete. ([see requirements](#requirements))

## Demo
![Demo](./demo.gif)

## Main Storyboard
![Main Storyboard](./main-storyboard.png)

## Requirements
- [x] Static photo tiles on the initial screen
  - [x] Optional: Photo tiles move with scrolling
- [x] Sign In
  - [x] Tapping on email/password reveals the keyboard and shifts the scrollview and Sign In button up.
  - [x] Upon tapping the Sign In button.
    - [x] If the username or password fields are empty, user sees an error alert.
    - [x] If credentials are incorrect, user sees a loading indicator for 2 seconds followed by an error alert.
    - [x] If the credentials are correct, user sees a loading indicator for 2 seconds followed by a transition to the Sign In screens.
  - [x] Optional: When the keyboard is visible, if the user pulls down on the scrollview, it will dismiss the keyboard.
  - [x] Optional: On appear, scale the form up and fade it in.
- [ ] Optional: Create a Dropbox
  - [ ] Optional: Tapping in the form reveals the keyboard and shifts the scrollview and "Create a Dropbox" button up.
  - [ ] Optional: Tapping the Agree to Terms checkbox selects the checkbox.
  - [ ] Optional: Tapping on Terms shows a webview with the terms.
  - [ ] Optional: User is taken to the tutorial screens upon tapping the "Create a Dropbox" button.
- [x] Tutorial Screens
  - [x] User can page between the screens
  - [ ] Optional: User can page between the screens with updated dots
  - [x] Optional: Upon reaching the 4th page, hide the dots and show the "Take Carousel for a Spin" button.
- [x] Image Timeline
  - [x] Display a scrollable view of images.
  - [x] User can tap on the conversations button to see the conversations screen (push).
  - [x] User can tap on the profile image to see the settings view (modal from below).
- [x] Conversations
  - [x] User can dismiss the conversations screen
- [x] Settings
  - [x] User can dismiss the settings screen.
  - [x] User can log out
  - [x] Optional: Sign Out UIAlertController
- [ ] Optional: Learn more about Carousel
  - [ ] Optional: Show the "Learn more about Carousel" button in the photo timeline.
  - [ ] Optional: Tap the X to dismiss the banner
  - [ ] Optional: Track the 3 events:
    - [ ] View a photo full screen
    - [ ] Swipe left and right
    - [ ] Share a photo
    - [ ] Optional: Upon completion of the events, mark them green.
  - [ ] Optional: When all events are completed, dismiss the banner.
