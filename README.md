# Ride Share
Remember the ride share exercise we did with designing and creating a system to track the ride share data from a CSV file? We did a lot of great work on this exercise in creating arrays and hashes of data, but we've learned a lot since we did that exercise!

Now, we're going to use our understanding of classes, methods and attributes to create an object-oriented implementation of our ride share system.

## Learning Goals
Reinforce and practice all of the Ruby and programming concepts we've covered in class so far:
- Creating and instantiating classes with attributes
- Creating class methods and instance methods within our classes
- Writing pseudocode and creating tests to drive the creation of our code


## Context
We have a code base that already pulls data from CSV files and turns them into the following objects:
- `Driver`s
- `Passenger`s
- `Trip`s

All of this data is managed in a class `TripDispatcher`.

We are going to continue making functionality that works with this data, such as finding the cost of a specific trip, or the total amount of money a passenger has spent, and also make functionality to create a new trip.

### The Code So Far
#### Driver
Each `Driver` has:
- an ID, name, vehicle identification number, and a status indicating their availability
  - Each vehicle identification number should be a specific length to ensure it is a valid vehicle identification number
  - a driver's availability should be either `:available` or `:unavailable`
- a list of trip instances that only this driver has taken

Each `Driver` instance is able to:
- retrieve an average rating for that driver based on all trips taken

#### Passenger
Each `Passenger` has:
- an ID, name and phone number
- a list of trip instances that only this passenger has taken

Each `Passenger` instance is able to:
- retrieve the list of all previous driver instances associated with trips this passenger has taken

#### Trip
Each `Trip` has:
- an ID, a passenger, a driver, and a rating
  - Each rating should be within an acceptable range (1-5)

Each `Trip` instance is able to:
- retrieve the associated driver instance
- retrieve the associated passenger instance

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

**Exercise:** Look at this requirement in Wave 1: "For a given driver, calculate their total revenue for all trips. Each driver gets 80% of the trip cost after a fee of $1.65 is subtracted." Spend some time writing pseudocode for this.

### Wave 1

When our program runs, it reads our CSV data. `TripDispatcher` reads and parses the CSV files in its `initialize` and populates instances of `Driver`s, `Passenger`s, and `Trip`s into our collections of `Driver`s, `Passenger`s, and `Trip`s.

Now we want to enhance the trip functionality to include support for cost and duration.

- Update `TripDispatcher` so that it uses the file `support/trips-full.csv`
- Update the `Trip` class so it has references that hold the new data provided in that CSV
- Update the `TripDispatcher` class so it correctly makes `Trip` instances with the new information
- Update the `Trip` class so it can retrieve the cost for the trip
- Update the `Trip` class so it can calculate and retrieve the *duration* of the trip

Now that we have data for cost available for every trip, we can do some interesting data processing.

- For a given passenger, add the ability to return the total amount of money they have spent on all trips
- For a given passenger, add the ability to return the total amount of time they have spent on their trips
- For a given driver, calculate their total revenue for all trips. Each driver gets 80% of the trip cost _after_ a fee of $1.65 is subtracted.

**All of this code must have tests.**

### Wave 2

Our program needs a way to make new trips and appropriately assign a driver and passenger.

Let's look at our `TripDispatcher`. Add functionality in `TripDispatcher` so it can make new trips with passengers and drivers.
- Create a new method in `TripDispatcher` whose responsibility is to make a new trip. This method should:
  - take in as a parameter the ID of a passenger to associate with this new trip
  - use the first existing instance `Driver` whose status is available as a driver to associate with this new trip
  - make a new instance of `Trip`
    - The start date of this trip is the current time
    - The end date of this trip is `nil`
  - modify this specific driver using a new helper method in `Driver`
    - modify the collection of `Trip`s in that specific driver
    - set this driver's status to unavailable
  - modify the collection of `Trip`s in that specific passenger using a new helper method in `Passenger`
  - modify the collection of `Trip`s in `TripDispatcher`

**All of this code must have tests.**

### Wave 3

We want to evolve `TripDispatcher` so it assigns drivers in more intelligent ways. Every time we make a new trip, we want to pick drivers who haven't completed a trip in a long time.

In other words, we should assign the driver to **the available driver whose most recent trip ending is the oldest compared to today.**

Refactor creating a trip in `TripDispatcher` with the following rule:
- A new trip can only have a driver who
  - has a status of available
- Of those eligible drivers, pick the _one_ driver with the following rules:
  - compare each available driver's trips that meets the following requirements:
    - the trip's *end date* is not `nil`
    - the end date is the closest to today's current date compared to the other trips the driver has made
    - _Ex:_ Consider the following trips: a trip with end date of Jan 1 2018, a trip with end date of Jan 2 2018, and a trip with end date of `nil`. The trip closest to today's current date compared to others is the trip with end date of Jan 2 2018
  - compare those trips with each other. From those trips, pick the trip whose end date is the farthest from today's current date compared to the other trips
    - _Ex:_ Consider the following trips: a trip with end date of Jan 1 2018 and a trip with end date of Jan 2 2018. The trip farthest from today's current date compared to others is the trip with the end date of Jan 1 2018
  - pick the driver associated with that trip

**All of this code must have tests.**

## What Instructors Are Looking For
Check out the [feedback template](feedback.md) which lists the items instructors will be looking for as they evaluate your project.
