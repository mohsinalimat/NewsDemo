# NewsDemo

### NewsDemo  APP ,  MVVM  + RxSwift  implementation in iOS 
# ScreenShots

![N|Solid](https://github.com/AliAdam/NewsDemo/blob/master/screenShots/demo.gif?raw=true)


### MVVM architecture + Router
MVVM (Model-View-ViewModel) is derived from MVC(Model-View-Controller).
It is introduced to solve existing problems of Cocoa's MVC architecture in iOS world.
One of its feature is to make a better seperation of concerns so that it is easier to maintain and extend.

*  Model: It is simillar to `model` layer in MVC (contains data )

* View: UIViews + UIViewControllers 

* ViewModel: A mediator to glue two above layer together (contains  business logic).

* Router: When the user taps  to navigate to the next scene . A router extracts this navigation logic out of the view controller. It is also the best place to pass any data to the next scene. As a result, the view controller is left with just the task of controlling views.

* Builder: initialize ViewController, ViewModel and Router
provide the ViewController to the outside world (via the viewController() method)
if the Scene needs some initial data it is injected into the Builder who then injects it into the ViewModel


An important point in MVVM is that it uses a binder as communication tool between View and ViewModel layers.
A technique named `Data Binding` is used with RxSwift . 

### Modules  
Modules divied the app into  mudules each module has  screens inside it  
each module  have it is own  storyboard 
inside module each screen have folder contain MVVM classes 

* ```We have only two Modules on the app``` 
* ```Main```   Splash screen ,   NewsList Screen 
*  ```NewsDetails```  NewsDetails Screen ,Filter screen (to choose news category and country)

### Storyboard 
each module has his own storyboard to make life easer when want to access any view contoller inside module 
you can add storyBord name here 
```Extension -> Storyboard Extension -> extension UIStoryboard -> enum Storyboard: String ```
be sure to use your viewcontroller  class as the viewcontroller id on inside StoaryBoard 


enum Storyboard: String {
case main
case newsdetails

var filename: String {
return rawValue.capitalized
}
}


then  when ever you want to use it call it like this   
```
let viewController : ViewController = UIStoryboard.storyboard(.main).instantiateViewController()
```

### Repository
Implement repository  Pattren to give the viewModel one entry point for loading data from server or from mockups for unit testing 

### Network 
Network layer read the base url form  ``` Info.Plist```     you can change  the url from it 

* NetworkProvider.swift 
this is a shared sigletone for all API Calling  Like the following one 

* NetworkResponse.swift 
``` error```: in case error occure pass the error
``` success```: in success case pass the object to it

* NetworkRouter.swift 
here you add method name   and type if it is get or post  and the path for it  and headers  and it will  genrate the URLRequest  you need to acces this API 
you will call this inside ```NetworkProvider.swift``` 

```let request = alamofireManager.request(NetworkRouter.getNewsList(parameters))```

#### Libraries
* [Alamofire '4.8.2'] to perform HTTP requests under `Model` layer. 
* [RxSwift '5.0.0' + RxCocoa '5.0.0'] to do "data binding" job which binds `ViewModel` and `View`
* [ESPullToRefresh '2.9']  to add pull to refresh and load more to tableView
* [ReachabilitySwift  '4.3.1'] to listen to network status change 

