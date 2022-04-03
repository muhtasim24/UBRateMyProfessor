Original App Design Project - README
===

# CS-UBRateMyProfessor

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

* User can create a review/rating
* User can search up professors
* User can like a review/rating
* User can create an account
* User can login
* User can add classes that each professor taught
    * as text/searchs box 

**Optional Nice-to-have Stories**

* List best teachers for each subject (build schedule of ideal teachers using classes)
* Alerts for Professors when they recieve a review/rating
* Schedule

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
* Stream Subject List : User can search up the subject and the top professors would be listed from best rating to worst rating

* Detail : User can press on Professor's name and view profile
    * User can view ratings/reviews
    * User can see what classes Professor has taught
    * User can see 3 most liked review posts
        * option/ button(or max number we specific if there is to many) to see all comments
* Detail: * Top rated professor for each class
    * additional feature
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
* Profile
   * Go to next screen by logging in
       * List of professors
* Professors List (shows name, and overall rating) -- stream
   * Clicking on professor leads to detailed professor view
   * Clicking on tab navigation leads to profile / recent stream
* Detailed Professor View
    * Shows specific ratings, and comments of professor
* Profile
    * Shows users specific posts, how many posts, average rating given 
* Stream of post recent comments & ratings

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
