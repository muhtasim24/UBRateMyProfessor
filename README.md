Original App Design Project - README
===

# CS-UBRateMyProfessor
https://www.figma.com/file/mPGoCrNJekPHP9xQzhaZIR/CSE-UB-Rate-My-Professor?node-id=0%3A1
## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview

### Description

This app is a strip down version of Rate my Professor solely for UB students and Professors. Students will be able to leave a review/rating for each Professor for classes they took already in the past. This will help future students choose their classes for upcoming semesters and help professors imporve their teaching methods from the feedback they recieve. 

### App Evaluation
- **Category:** Social Networking/Education
- **Mobile:** This app would be primarily developed for mobile but would work on a computer as well. Students will be able to view reviews/ratings on realtime. Professors will be able to receive feedback on realtime.
- **Story:** Helps students to pick their ideal professor for the class they wish to take. Allows professors to recieve feedback from students.
- **Market:** All UB CSE Students and Professors
- **Habit:** Beginning and end of each semester when students are picking classes, or to leave a review of a professor a.fter a terrible/amazing experience
- **Scope:** Base: list professors, list ratings, list reviews, sort by class each professors teach, user can add comments. Stripped down version will just have professors list
## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [ ] User can create a review/rating
- [ ] User can search up professors
- [ ] User can view all ratings and all subjects for each professor
- [ ] User can create an account
- [X] User can login
- [X] User stays logged in across restarts
- [X] User can logout
- [ ] User can add classes that each professor taught
    - [ ] as text/searchs box 

**Optional Nice-to-have Stories**

- [ ] List best teachers for each subject (build schedule of ideal teachers using classes)
- [ ] Alerts for Professors when they recieve a review/rating
- [ ] Schedule

### 2. Screen Archetypes
* Login Screen
    * User can login
    * Verify only UB emails
* Register - User signs up or logs into their account
    * User can Select Year
    * User can Select Subjects
* Stream Professor List : User can scroll through a list of all professors
    * table view buttons that jumps to professors profile
        * contains ratings
        * posts
        * possible classes
* Stream Subject List : User can view all the classes in the CS cirriculum and can search up the subject

* Detail : User can press on Professor's name and view profile
    * User can view ratings/reviews
    * User can see what classes Professor has taught
    * User can see 3 most liked review posts
        * option/ button(or max number we specific if there is to many) to see all comments
* Detail: * Top rated professor for each class
    * additional feature

* Detail Subject List: User can press on the subject and it would take you to a list of professors that teach that class and the top professors would be listed from best rating to worst rating

* Creation: Students make a rating/review
    * User can create a review/rating for a professor
        * Include the class
        * Include Professor
    * User can comment on a review/rating
    * User can like a review/rating

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Stream Professors list
* Creation
* Profile

**Flow Navigation** (Screen to Screen)

* Login
     * Stream 
     * Register
* Register
     * Stream
* Stream (List of Professors)
    * Logout/Login
    * Detail
    * Stream Subject List
* Detail Professor List
    * Stream List of Professors
* Stream Subject List
    * Stream List of Professors
    * Detail Subject List
* Profile

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://github.com/CS-UBRateMyProfessor/RateMyProfessor/blob/main/FigmaWireframe.png" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

### Models
- Professor (object)
    - Name (String)
    - Reviews (Object list)
        - Difficulty Rating (Number)
        - Overall Rating (Number)
        - Review text (String)
    - Subjects (String list)
- User (object)
    - Username (String)
    - Password (String)
- Subjects (String list)


   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | Professor       | Object   | Contains all information of a professor |
   | Name          | String   | Name of Professor |
   | Reviews       | List of Objects | All reviews the professor got |
   | Subjects      | List of Strings | Lists all the subjects the professor teaches |
   | Avg Difficulty Rating | Number   | Average of all difficulty ratings |
   | Avg Overall Rating | Number | Average of all overall ratings for professor |



   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | Reviews       | Object   | Contains all info students leave in review for professor |
   | Difficulty Rating | Number | Individual difficulty rating student left |
   | Overall Rating | Number | Individual difficulty rating student left |
   | Comment text | String | Feedback for Professor |
   
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | User          | Object   | Contains info about user |
   | Username      | String   | Username String |
   | Password      | String   | Password String |

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | All Subjects  | String List | List of all subjects that our teachers teach |

### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

- Login Screen
    - (Read / GET) Log in existing user
- Register Screen
    - (Create / POST) Make new User object
- Professor List
    - (Read / GET) Get list of professors
- Subject List
    - (Read / GET) Get list of professors (but sort them by subject)
- Professor Detailed Screen
    - (Read / GET) Get list of reviews for professor
- Add New Review
    - (Read / GET) Get specific professor
    - (Create / POST) Create new review and add under professor

# Week 1 Progress
- [X] Add back4app backend
- [X] Add launch screen

## Video Walkthrough Gifs

Here's a walkthrough of implemented user stores:

User can login, stayed logged in, logout: 
<img src= 'http://g.recordit.co/IIEeawoutZ.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

<img src= 'https://github.com/CS-UBRateMyProfessor/RateMyProfessor/blob/main/Week1.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

