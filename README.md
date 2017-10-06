# Leftovrs
## GA WDI13 Project Two - Ryan Monro

(https://frozen-earth-59140.herokuapp.com/)

## The Problem
Australians throw out $8 billion worth of edible food every year. Often people find themselves with food that's still perfectly fine, but they know they won't eat before it's too late. Sometimes this can be food that they bought impulsively or was included as part of a deal, but they are not interested in. Leftovrs tries to connect these people and their unused food with people nearby who want to buy it.

## User Stories

- "As a buyer, I want to see items close to my location so I can see what's available near me."
- "As a seller, I want to see a list of my items so I can keep track of what has sold."
- "As a buyer, I want to see the most recently added items so I can have the opportunity to buy before any other buyers."

## Cool Tech
- Geolocation. If the user gives approval for the site to use their device's location, their location will be automatically added to items that they list. The site can also calculate the user's distance from other objects that are for sale.
- Google Maps. The item details page shows the location of the item on the map. 
- Sinatra and Heroku. Let's face it, this is some cool tech. We've deployed a database-backed full stack web app.

## Challenges
-  Distance from the user to other items for sale was calculated in Javascript: this required the server to pass coordinates as hidden HTML, and the Javascript calculates the distance and displays it to the user.
- Sorting items for sale by their distance from the user would have been nice, but I decided this was out of scope because it requires passing the user's location to the server first, and then querying the database. It would be a nice feature though.
- Form validation. I didn't have time to implement ActiveRecord validation, and verified some of the form data manually as I realised how easy it was to break my app by entering the wrong data.

## Lessons Learned
- I spent quite a lot of time in design for this project, and it was time well spent. Creating the wireframes of my site effectively forced me to make a lot of decisions early on that influenced the layout and data structure of the site. However, taking this further and including all of the user's paths through the site from sign up, log in, creating and editing items, etc. would have helped even more. The lesson learned is time spent in design without writing a line of code is time well-spent.
- It would have been worth keeping in mind how achievable all my features were. I had some great ideas while making the wireframes but later in the process realised they were out of scope.
- Images. That would have been nice.
- Commit often! I went from first commit to almost entire working site.
- I left CSS until fairly late in the process and I regret nothing: getting the site working but looking terrible was more important for the first few days of the project.
