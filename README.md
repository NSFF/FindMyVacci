# Find my vaccination centre IOS app

This project represents an IOS phone application to find your local vaccination centre. The data used in this project is fictional and does not make use of existing data bases/servers.

The app shows a table view of the vaccination centres and if you press on one, it will show you a map view with some extra information about the vaccination centre and it's location on the map.

# Software used

Xcode Version 12.4 (12D4e)

# Project goals reached
(+ reached; - not reached)

+Tab bar with table view of Vaccination centres

+Tab bar with map view and user location

+Asking permissions for using user location

+Adding New Vaccination Centre

+Adding custom photo from photo library and having a default one

+When tapping the photo preview during the "adding a new vacci centre" process, it brings a pop-up of the image in a bigger version.

-Not Automaticly zooming on user location

-No Map annotations of Vaccination Centres

-No info preview when clicking a vaccination centre annotation

# Known Bugs

* Map not automaticly zooming in to user location
* Photo library permission is not being asked. This is expected behavior by using UIImagePickerController since IOS 11 because UIImagePickerController is Read only operation

# Disclaimer

This project was an assignment given by the Erasmus university college Brussels, for the IOS development course given by Johan Van Den Broek. The computer used while building this app is from Huei Li Yap. This is the reason why you will see her name mentioned in the comments of files. (auto-generated by xcode) She did not work on this project but I would like to thank her for lending me her laptop.

# References
I used several tutorials to help me during this project:

Core data tutorial: https://www.youtube.com/watch?v=O7u9nYWjvKk

Accessing Photo library: https://www.youtube.com/watch?v=J86_F7_exfE

Segue initializing variables error: https://stackoverflow.com/questions/31576232/passing-image-to-another-view-controller-swift

Image Pop-up: https://www.youtube.com/watch?v=V0LQbDGbdbI

Optionals and unwrapping errors/guide: https://stackoverflow.com/questions/32170456/what-does-fatal-error-unexpectedly-found-nil-while-unwrapping-an-optional-valu

Loading an image into an UIImage var: https://stackoverflow.com/questions/37574689/how-to-load-image-from-local-path-ios-swift-by-path

Loading a file from relative path: https://forums.swift.org/t/relative-file-url-and-swift-scripts/30479/3

Passing data with unwind segue: https://stackoverflow.com/questions/35313747/passing-data-with-unwind-segue

Refresh viewTable: https://www.youtube.com/watch?v=BtMa52KShm0

Converting text to Int: https://developer.apple.com/forums/thread/677100

Adding Title/subtitle/image to table view: https://stackoverflow.com/questions/5190648/why-is-detailtextlabel-not-visible

Passing variables to other viewControllers without segue: https://stackoverflow.com/questions/39494454/pass-data-between-viewcontroller-and-tabbarcontroller

Removing MapAnnotations: https://stackoverflow.com/questions/32850094/how-do-i-remove-all-map-annotations-in-swift-2

Deleting rows in Table View: https://medium.com/@leannemlis/add-delete-functionality-to-a-table-view-row-db67349551

Filtering an Array: https://www.codingem.com/filter-an-array-in-swift/

Filtering UserLocation out of annotations array: https://stackoverflow.com/questions/10865088/how-do-i-remove-all-annotations-from-mkmapview-except-the-user-location-annotati
