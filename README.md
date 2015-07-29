The purpose of this exercise is to create a type to search feature.

You will be tasked to create an input with a results field on the page. With each key press, the results field will be updated based on the response returned to you by a search API.

You will be using TMDB's search API to get a list of Movies, Shows, and People. Documentation for the API can be found at http://docs.themoviedb.apiary.io/#reference/search/searchmulti

We have provided the necessary API call to retrieve the results in `home_controller.rb`, it will be your task to parse the response and update the view to display the necessary information.

We have provided a mock of what your view should look like under search_mocks.pdf

In order to grab the poster/profile for each item, you will be using the poster_path/profile_path returned by the API, along with the `image_url` provided in fanhattan.yml

Example image path: `https://image.tmdb.org/t/p/w92/jIhL6mlT7AblhbHJgEoiBIOUVl1.jpg`
