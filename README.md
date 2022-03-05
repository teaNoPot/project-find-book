# Project find books
This repository is the first part of the main project which aims to search books and find libraries containing them. I've decided to divide into 4 potential parts : 
- A flutter app that allows users to search books and display their details. 
- A flutter app that finds librairies using openstreetmap API.
- A Backend project that allows users to find which librairy has their selected book (and other similar books). Using geolocalisatiion.
- The complete project integrating the three parts (adding better UI and functionalities)

I'm also envisioning a fifth part to the project :
- Creating a recommendation system for the project.


## Project summary

``` 
Level : 1
Status : OnGoing
Hours spent : 8 hours 
```
## TODO

UI design : 

[ ] Create AppBarUI
[ ] Create SearchBarUI
[x] Create a data mockup for book list.
[ ] Create a BookListView
[ ] Create a BookInfoScreen
[ ] Create a PopularBookListView to view popular books (using the data mockup)


## Usecase flow of the main project

[Book_details.pdf](./assets/Book_details.pdf)




## PROJECT BREAKDOWN STRUCTURE

- 110-000 An app : 
	- 111-000: An android/IOS For type of application.
		- 111-001: Deploy to android/IOS
	- 112-000: Flutter For framework.
		- 112-001: Design part of an application
	- 113-000: Dart For Programming language.
	- 114-000: Android studio/ Visual studio code For environement.
		- 114-001: Getting Started (Installing environement, paths)

- 120-000 Searches books :  
	- 121-000: API to fetch data
		- 121-001 How to fetch data?
	- 122-000: Search bar UI 
		- 121-001: How to design the UI?
	- 123-000: asynchronous calls -> response
		- 123-001: How to perform these calls ?
		- 123-002: What is the behavior of the async calls in Dart?
	- 124-000: HomePage UI
	  - 124-001: Appbar UI
	  - 124-002: Book List View UI
	  - 124-003: Popular Book List View UI
	- 125-000: Book Info Screen UI
	  - 125-001: Book model

- 130-000 Displays details : 
	- 131-000: Grid of cards displaying book results
		- 131-001: How to design a grid of cards?
		- 131-002: How to design the card? 
		- 131-003: What data to display on the results?
	- 132-000: OnClick : brings a new view of Book Details
		- 132-001: What design of the view would look like ?
		- 132-002: How to relate it to the previous view ?
	- 133-000: Book data comes mainly from the API called.
		- 133-001: Does it uses any other API?

