# Ride Share
Remember the ride share exercise we did with designing and creating a system to track the ride share data from a CSV file? We did a lot of great work on this exercise in creating arrays and hashes of data, but we've learned a lot since we did that exercise! Now, we're going to use our understanding of classes, methods and attributes to create an object-oriented implementation of our ride share system.

## Learning Goals
Reinforce and practice all of the Ruby and programming concepts we've covered in class so far:
- Creating and instantiating classes with attributes
- Creating class and instance methods within our classes
- Using TDD to drive the creation of tests for our code
- Importing data from a CSV file

## Problem Statement
Create a system that will manage information related to ride sharing. The system should have a way to keep track of drivers, riders and the trips that the drivers take with their riders.

#### Driver
- Each driver should have information uniquely identifying them like name, license plate and vehicle identification number
- Each vehicle identification number should abide by a specific pattern or length to ensure it is a vehicle identification number
- Given a driver object, you should be able to retrieve the list of trip instances that only this driver has taken
- Given a driver object, you should be able to retrieve an average rating for that driver based on all trips taken
- You should be able to retrieve all drivers from the CSV file
- You should be able to find a specific driver using their numeric ID

#### Rider
- Each rider should have information uniquely identifying them like name, phone number and a numeric ID
- Given a rider object, you should be able to retrieve the list of trip instances that only this rider has taken
- Given a rider object, you should be able to get the list of all previous drivers (through the trips)
- You should be able to retrieve all riders from the CSV file
- You should be able to find a specific rider using their numeric ID

#### Trip
- Each trip should have information uniquely identifying it like a rider ID, a driver ID, date, rating
- Each rating should be within an acceptable range (1-5)
- You should be able to retrieve all trips from the CSV file
- For any trip object, you should be able to retrieve the associated driver instance through the driver ID
- For any trip object, you should be able to retrieve the associated rider instance through the rider ID
<!-- - You should be able to find a specific trip using the numeric ID -->
- You should be able to find all trips for a given driver
- You should be able to find all trips for a given rider

## Getting Started
This is a level 3, individual project.

We will use the same project structure we used for the previous project. Classes should be in files in the `lib` folder, and tests should be in files in the `specs` folder. You should utilize a spec helper file. You will run tests by executing the `rake` command, as configured in  a Rakefile.

The `support` folder contains CSV files which will drive you system design. Each CSV corresponds to a different type of object _as well as_ creating a relationship between different objects.

## Baseline
### Discussion
#### Phase 1
Let's start by **individually** creating the list of nouns and verbs that you would utilize in describing this problem.

After a few minutes, then you'll get together with your seat squad to discuss the nouns and verbs you came up with.

#### Phase 2
Use your list of nouns to begin thinking about what classes you will want to use. Use your list of verbs associated with nouns to consider what methods you need to put in which classes. This brainstorming process is not a failproof approach, but rather a starting point.

After a few minutes, then you'll get together with your seat squad to discuss the classes and methods you came up with.

#### Phase 3
Create a diagram that describes how each of these classes and methods (messages) will interact with one another as well as the CSV files.

### Setup
1. You will fork this repository in GitHub
1. You will git clone the repository to your computer
1. Create a test to check the instantiation of one of your object types (**RED**)
1. Create the class for the object tested in the step above (**GREEN**)
1. Use git add, commit and push commands to push you initial code to GitHub

### Optional
- Enhance the trip functionality to include support for starting and ending address
