## Cash App Stocks (iOS)
Candidate: Mingjun lei
Completed: 08/04/22

## Architectural 
Coordinator + MVVM
NetworkService(Request/Reponse) <=> DataProvider <=> Coordinator(ViewCotroller) <=> ViewModel <=> View

## Hireactur

## Trade-offs 
#### Why use Coordinator
The coordinator pattern would be used to display different UI flows if this app were to be built out more.
For now, it simply sets up the stocks list. In a full app, using this pattern with different UI components would relay triggered enumerated actions back to the coordinator. The coordinator would be responsible for modifying the current UI flow or presenting new flows.  

#### Why use MVVM
Each UI view has its corresponding ViewModel. 
We could reuse these views in the actual app and feed different ViewModels. 
ViewModel is easily to test cause there is no UI element involved
ViewModel has the responsibility to update the display content.
ViewModel must also get notified when UI changes to update its data correspondingly.
In the demo, I didn't add any action (tap, select, etc.) for flow change, 
but we can add the action handlers (through delegate or closure) to ViewModels. 

#### Why write the UI by code
Using Storyboard, we can quickly draw the UI, change properties, and add constraints. 
But there will be merge conflict, subclass, app size, and performance issues when the app becomes giant and the team grows. 

#### Why use UICollectionView
UICollectionView isolates the data source, the layout, and the delegate separately. 
As a result, we can provide different UI layouts, animations, and data models to generate different UI. And switching between the designs will be easy. So it has a higher customize possibility compared to UITableView. 

#### Why calculate the height program
The system can help compute the size if it sets up auto layout correctly.
But calculating the size base on the auto layout is expensive when the amount of UI components increases. 
And the system couldn't provide the correct size when constraints conflict or are unclear.

## How to run your project
Running with XCode 13.4.1 simulator or the real device (iOS 13+)

## Others
* iPhone and iPad are compatible.
* Support device rotation and screen split in iPad.
* Support dark mode
* Support pull to refresh
* Dynamic height based on internal content size.

## Known Issues 
* Cache the size for each collection cell when possible
* Pre-calculate the size and other preparing work in `prepare()` method
* Unit Test is currently focused on mock service and data fetching. 
* We can and more tests for ViewModel to verify its logic is correct.
* Better error handling user experience. 
