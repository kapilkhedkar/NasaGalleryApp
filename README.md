# Nasa Gallery App

A simple Gallery app displaying images of space loaded from a local JSON file. The app contains 2 screens:-
1. Image Grid screen ~ Displays a scrollable grid of images arranged in a Mosaic pattern using 'UICollectionViewCompositionalLayout'.
2. Image Details screen ~ Displays a selected image in full-screen with ability to zoom-in and zoom-out using Pinch Gesture. You can swipe left or right to scroll through other images using 'UIPageViewController'. On clicking the Info icon, you can see details about the image like 'title','description', etc.

The app is built using the MVC (Model-View-Controller) architecture and Swift programming language. 

NOTE:-
1. You will need to run 'pod install' before running the application.
2. Since this application uses 'UICollectionViewCompositionalLayout', the minimum OS required is iOS 13.0
