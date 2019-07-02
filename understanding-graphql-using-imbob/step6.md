**This introductory video covers the tasks you'll perform in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/RUz4XW9KshA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

**Task 1:** Open another new tab in GraphQL Playground.

**Task 2:** Add the security access token by copy and pasting

`{"authorization": "ch3ddarch33s3"}`{{copy}}

In this tab well register a new subscription to the API, `onMovieAdded`.

## Add a the subscription `onMovieAdded`

**Task 3:** Subscribe to the event, `onMovieAdded` by copying and pasting the following into the new tab you just created on GraphQL Playground.

`
subscription onMovieAdded {
    onMovieAdded(channelName: MOVIE_CHANNEL) {
        id
        name
        createdAt
        storedAt
        body
    }
}
`{{copy}}

## Adding some movies

**Task 4:** Open yet another new tab in GraphQL Playground. (I know, this is getting redundant.)

**Task 5:** Add the security access token by copy and pasting

`{"authorization": "ch3ddarch33s3"}`{{copy}}

**Task 6:** Copy the following mutation into the tab you just created in GraphQL Playground:

`mutation {
    addMovie(movie: {
        title: "2001: A Space Odyssey",
        releaseDate: "1968-05-12"}) {
          id
          title
    }
}`{{copy}}

**Task 7:** and execute it by clicking the circled arrow in GraphQL Playground

Let's add another movie.

**Task 8:** Copy the following mutation into the current tab:

`mutation {
     addMovie(movie: {
         title: "Yellow Submarine",
         releaseDate: "1968-11-13"}) {
           id
           title
     }
 }`{{copy}}

**Task 9:** Now go back to the tab in which you registered the subscription, `onMovieAdded`. You should see messaging activity.

**Task 10:** Then, come back and copy this query into the browser window to see the movie list:

 `
 {
   movies {
     title
     releaseDate  
     actors{
       firstName  
       lastName  
     }
     directors{
       firstName  
       lastName  
     }
   }
 }`{{copy}}
 

