# NBK News

I implemented the app by mixing UIKit and SwiftUI frameworks on MVVM architecture. The application supports both **dark** and **light** modes. 

### Home Screen
I used Storyboard to build the "Home" screen. Implementation of a table views cell called "NewsCell" is completed using a programmatic approach. 
To asynchronously load images, I added Nuke SPM (https://github.com/kean/Nuke). 

### Filter Screen
I used the SwiftUI framework to build this screen.

### Details Screen
I used the SwiftUI framework to build this screen.

### Network Module
I built a separate SPM module called "NewsNetwork" locally in the Packages folder. This module consists of all data related to the Network side of the app. 

### Unit/UI Test
Wrote unit tests using the XCTest framework.
