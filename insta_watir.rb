require 'watir'
require 'selenium-webdriver'
require 'csv'
require 'headless'

# Initialising the Chrome Browser 
# headless = Headless.new
# headless.start
#switches = ['--incognito']
browser = Watir::Browser.new :chrome #, switches: switches

# Initialising the base  the required 
insta_url="https://www.instagram.com"
email= "Enter_your_test_email"
fullname="Enter_your_fullname"
username="Enter_your_username"
password="Enter_your_password"

#Url to follow
url_follow="https://www.instagram.com/user_to_follow/"

#Go to the website
browser.goto(insta_url)

# The CSV file to store the details of multiple accounts
CSV.open("insta_file.csv", "a+") do |f|
		f << ["Email ID","Username","Fullname","Password"]
	end

starting_iterator = 'aaa'
ending_iterator = 'zzz'
for i in starting_iterator..ending_iterator do
	local_email=email+"+"+i.to_s+"@gmail.com"
	local_username=username+"_"+i.to_s
	local_fullname=fullname+"_"+i.to_s
	local_password=password+"_"+i.to_s
	
	browser.text_field(:name => "emailOrPhone").set("#{local_email}")
	sleep(4)
	browser.text_field(:name => "fullName").set("#{local_fullname}")
	sleep(4)
	browser.text_field(:name => "username").set("#{local_username}")
	sleep(4)
	browser.text_field(:name => "password").set("#{local_password}")
	sleep(4)

	browser.span(:text => "Sign up").click

	sleep(5)

	CSV.open("insta_file.csv", "a+") do |f|
	f << [local_email,local_username,local_fullname,local_password]
	end

	puts local_email,local_username,local_fullname,local_password
	
	browser.goto(url_follow)
	sleep(4)
	if(browser.button(:class => "_qv64e _gexxb _r9b8f _njrw0").exists?)
		browser.button(:class => "_qv64e _gexxb _r9b8f _njrw0").click
		sleep(15)
	end

	sleep(10)
	
	browser.close()

	# Create new browser and loop again after that
	browser = Watir::Browser.new :chrome, switches: ['--incognito']
	browser.goto(insta_url)

	sleep(5)
end