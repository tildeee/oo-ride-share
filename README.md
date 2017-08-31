# Ride Share
Remember the ride share exercise we did with designing and creating a system to track the ride share data from a CSV file? We did a lot of great work on this exercise in creating arrays and hashes of data, but we've learned a lot since we did that exercise!

Now, we're going to use our understanding of classes, methods and attributes to create an object-oriented implementation of our ride share system.

## Learning Goals
Reinforce and practice all of the Ruby and programming concepts we've covered in class so far:
- Design a system using object-oriented principles
- Create and instantiate classes with attributes
- Create class and instance methods within our classes
- Write pseudocode and create tests to drive the creation of our code

## Expectations
This project will have requirements that are more open-ended than previous projects you have worked on. This is expected. As this is your final Ruby project, you will be expected to:
- Make decisions on how to structure your classes and methods
- Ask questions when you need clarification
- Acknowledge that the way you implement something may be different than the way your neighbor implements it


## Primary Requirements
Create a system that will simulate storing all of the data for a ride sharing application. If you are not familiar with how Ride Sharing services work, we'll give a brief overview. Apps like Lyft are available to people with a smartphone. They pair up the users with the drivers, who use their own vehicles to pick up passengers and drive them to their desired destination.

Create a system that will manage information related to ride sharing. The system should have a way to keep track of drivers, passengers and the trips that the drivers take with their passengers.

### User Stories
### As an administrator
- I can create a new driver
- I can create a new passenger
- I can search for a specific driver based on ID
- I can search for a specific passenger based on ID
- I can search for a specific trip based on trip ID

### As a driver
- I can accept or decline a trip
- I can start a trip
- I can stop a trip
- I can rate my passenger after a trip
- I can view my profile
- I can edit my profile
- I can see my average rating
- I can see the list of trips I have taken
- I can view a single trip details which includes passenger information

### As a passenger
- I can request a trip
- I can rate my driver after a trip
- I can view my profile
- I can edit my profile
- I can view my average rating (given from drivers)
- I can see the list of trips I have taken
- I can view a single trip details which includes driver information

<!--
#### Driver
Each driver should:
- have an ID, name, and vehicle identification number
  - Each vehicle identification number should be a specific length to ensure it is a valid vehicle identification number

Given a driver object, you should be able to:
- retrieve the list of trip instances that only this driver has taken
- retrieve an average rating for that driver based on all trips taken

You should be able to:
- retrieve all drivers from the CSV file
- find a specific driver using their numeric ID

#### Passenger
Each passenger should:
- have an ID, name and phone number

Given a passenger object, you should be able to:
- retrieve the list of trip instances that only this passenger has taken
- retrieve the list of all previous driver instances (through the trips functionality built above)

You should be able to:
- retrieve all passengers from the CSV file
- find a specific passenger using their numeric ID

#### Trip
Each trip should:
- have an ID, passenger ID, a driver ID, date, rating
-   Each rating should be within an acceptable range (1-5)

Given a trip object, you should be able to:
- retrieve the associated driver instance through the driver ID
- retrieve the associated passenger instance through the passenger ID

You should be able to:
- find all trip instances for a given driver ID
- find all trip instances for a given passenger ID
- retrieve all trips from the CSV file -->

## Getting Started
This is a [level 3](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md), individual project.

We will use the same project structure we used for the previous project. Classes should be in files in the `lib` folder, and tests should be in files in the `specs` folder. You should utilize a spec helper file. You will run tests by executing the `rake` command, as configured in a Rakefile. You should have **95% code coverage** using simplecov.
<!--
The `support` folder contains CSV files which will drive your system design. Each CSV corresponds to a different type of object _as well as_ creating a relationship between different objects. -->

## Baseline Design
### Discussion
#### Phase 1
Let's start by **individually** creating the list of nouns and verbs that you would utilize to describe this problem.

After a few minutes, then you'll get together with your seat squad to discuss the nouns and verbs you came up with.

#### Phase 2
Use your list of nouns to begin thinking about what classes you will want to use. Use your list of verbs associated with nouns to consider what methods you need to put in which classes.

After a few minutes, then you'll get together with your seat squad to discuss the classes and methods you came up with.

#### Phase 3
Create a diagram that describes how each of these classes and methods (messages) will interact with one another as well as the CSV files.

### Setup
1. Fork this repository in GitHub
1. Clone the repository to your computer
1. Create/copy a rakefile to run your tests
1. Open the `specs/spec_helper.rb` file to load your classes and start up simple coverage.  This file will load all the required gems and source files your spec files need so they only need to require the helper.  
  - Each of your spec files should `require_relative` the spec helper file.
1. Create a test to check the instantiation of one of your object types (**RED**)
1. Create the class for the object tested in the step above (**GREEN**)
1. Use git add, commit and push commands to push your initial code to GitHub

### Process
You should use the following process as much as possible:  

1. Write pseudocode
1. Write test(s)
1. Write code

Since this is the **last** Ruby-only project we are doing, and a level 3, the requirements are larger than previous projects. **It is possible you will not be able to complete all requirements**, but if you use the process above, you will still be able to share with your instructors the process and the design you have created.

### Optional Requirements
- The first optional should always be looking for improvements within the existing code you have already written. Are there any additional edge cases you might be missing in your tests? Any opportunity to use an enumerable method where you're using an each?
- Enhance your functionality to create a CSV database to load your initial data set. Hint: Use `Faker`.

### User Stories
- As a passenger, I can see the total amount of money I've spent on trips
- As a passenger, I can see the total amount of time I've spent on trips
- As a driver, I can see the total revenue for all of my trips.
  - Calculated by giving 80% of the trip cost _after_ a fee of $1.65 is subtracted
