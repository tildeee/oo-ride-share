# Ride Share
Remember the ride share exercise we did with designing and creating a system to track the ride share data from a CSV file? We did a lot of great work on this exercise in creating arrays and hashes of data, but we've learned a lot since we did that exercise!

Now, we're going to use our understanding of classes, methods and attributes to create an object-oriented implementation of our ride share system.

## Learning Goals
Reinforce and practice all of the Ruby and programming concepts we've covered in class so far:
- Creating and instantiating classes with attributes
- Creating class methods and instance methods within our classes
- Writing pseudocode and creating tests to drive the creation of our code


## Context
We have some a code base that already pulls data from CSV files and turns them into the following objects:
- `Driver`s
- `Passenger`s
- `Trip`s

We are going to continue making functionality that works with this data, such as finding the cost of a specific trip, or the total amount of money a passenger has spent.

### The Code So Far
#### Driver
Each `Driver` has:
- an ID, name, and vehicle identification number
  - Each vehicle identification number should be a specific length to ensure it is a valid vehicle identification number
- a list of trip instances that only this driver has taken

Each `Driver` instance is able to:
- retrieve an average rating for that driver based on all trips taken

You should be able to:
- find a specific driver using their numeric ID

#### Passenger
Each `Passenger` has:
- an ID, name and phone number
- a list of trip instances that only this passenger has taken

Each `Passenger` instance is able to:
- retrieve the list of all previous driver instances associated with trips this passenger has taken

You should be able to:
- find a specific passenger using their numeric ID

#### Trip
Each `Trip` has:
- an ID, passenger, a driver, date, rating
  - Each rating should be within an acceptable range (1-5)

Each `Trip` instance is able to:
- retrieve the associated driver instance through the driver ID
- retrieve the associated passenger instance through the passenger ID

#### TripDispatcher
The `TripDispatcher` has:
- a collection of `Driver`s
- a collection of `Passenger`s
- a collection of `Trip`s

The `TripDispatcher` has the following responsibilities:
- load collections of `Driver`s, `Passenger`s, and `Trip`s from CSV files
- store and manage this data into separate collections

The `TripDispatcher` does the following:
- on instantiation, loads and creates `Trip`s, `Passenger`s, and `Driver`s and stores them into collections

The `TripDispatcher` instance is able to:
- retrieve the collection of `Trip`s, `Passenger`s, and `Driver`s
- find an instance of `Driver` given an ID
- find an instance of `Passenger` given an ID

By the end of this project, a `TripDispatcher` will be able to:
- create new trips with assigning appropriate passengers and drivers

## Getting Started
This is a level 3, individual project.

We will use the same project structure we used for the previous project. Classes should be in files in the `lib` folder, and tests should be in files in the `specs` folder. You will run tests by executing the `rake` command, as configured in a Rakefile.

The `support` folder contains CSV files which will drive your system design. Each CSV corresponds to a different type of object _as well as_ creating a relationship between different objects.

## Setup
1. Fork this repository in GitHub
1. Clone the repository to your computer
1. Create/copy a Rakefile to run your tests
1. Run `rake` to run the tests

### Process
You should use the following process as much as possible:  

1. Write pseudocode
1. Write test(s)
1. Write code

## Requirements

### Baseline

To start this project, take some time to get familiar with the code. Do the following in this order:
1. Read through all of the tests
1. Look at the provided CSV files: `support/drivers.csv`, `support/passengers.csv`, `support/trips.csv`
1. Then look through the ruby files in the `lib` folder

Create a diagram that describes how each of these classes and methods (messages) interact with one another as well as with the CSV files.

Look for improvements within the existing code. Are there any additional edge cases you might be missing in your tests? Any opportunity to use an enumerable method where the code is using an each?

- Add any more tests that you think you need
- Refactor any code you would like to refactor
- Make sure the tests are passing before you move on

### Wave 1

When our program runs, it reads our CSV data. Specifically, in `Driver`, `self.all` reads the data from `support/drivers.csv`

Now we want to enhance the trip functionality to include support for cost and duration.

- Update `Trip` so that it uses the file `support/trips-full.csv`
- Update the `Trip` class so it has references that hold the new data provided in that CSV
- Update the `Trip` class so it can retrieve the cost for the trip
- Update the `Trip` class so it can calculate and retrieve the duration of the trip

### Wave 2

Now that we have data for cost available for every trip, we can do some interesting data processing.

- For a given passenger, add the ability to return the total amount of money they have spent on all trips
- For a given passenger, add the ability to return the total amount of time they have spent on their trips
- For a given driver, calculate their total revenue for all trips. Each driver gets 80% of the trip cost _after_ a fee of $1.65 is subtracted.

**All of this code must be written TDD and have tests.**

### Wave 3

Our program needs a way to make new trips and appropriately assign a driver and passenger.

Let's make a `TripDispatcher`

- driver has add trip
- passenger has add trip

- statuses, assigning trips
