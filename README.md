## Insta Script

An automated Ruby script with Watir and Selenium Webdriver to create Multiple Instagram Followers from a single Gmail ID. 

## Prerequisites

The following gems should be included in the code

#### 1. Watir
`require 'watir'`

#### 2. Selenium Webdriver 
`require 'selenium-webdriver'`

#### 3. CSV
`require 'csv'`

#### 4. Headless
`require 'headless'`

## How it works?

This script works because of a Gmail feature according to which if an email is concantenated <br>
with the character '+' and any string after that, it would refer to the initial email whenever used. <br>
Thus, multiple email names can be used to refer to the same email id. <br>

## Usage

After initialising the Webdriver, and going to the website signup page, <br>
Watir is used to fill in the text fields: "Email ID","Username","Fullname" & "Password" <br>
with the test email created beforehand.<br>

As instagram doesn't ask for verification straight away, one can go to the url of <br>
the user one wants to follow and automate watir to click on the follow button.<br>

Then we systematically iterate through strings and keep on concatenating to the test email <br>
and other fields. 

For example, if there is an email id "something@gmail.com", then, "something+anything@gmail.com" <br>
is seen as the same gmail account, where "anything" is any sequence of characters <br>
like "something@gmail.com", "something+1@gmail.com", "something+2@gmail.com" etc. <br>

We then store all the details of the multiple accounts created in a CSV file for future reference. <br>

## Disclaimer
This is for educational purposes only. This vulnerability has been already reported to Facebook <br>
 


