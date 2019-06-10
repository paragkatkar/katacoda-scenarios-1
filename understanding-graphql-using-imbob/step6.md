![Video Under Construction](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/video-under-construction.jpg)
 
 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

Open another new tab in GraphQL Playground.

Add the security access token by copy and pasting

`{"authorization": "ch3ddarch33s3"}`{{copy}}

In this tab well register a new subscription to the API, `onMovieAdded`.

## Add a the subscription `onMovieAdded`

Subscribe to the event, `onMovieAdded` by copying and pasting the following into the new tab you just created on GraphQL Playground.

`
subscription onMovieAdded {
    onMovieAdded(channelName: "MOVIE_CHANNEL") {
        id
        name
        createdAt
        storedAt
        body
    }
}
`{{copy}}

## Adding some movies

Open yet another new tab in GraphQL Playground. (I know, this is getting redundant.)

Add the security access token by copy and pasting

`{"authorization": "ch3ddarch33s3"}`{{copy}}

Copy the following mutation into the tab you just created in GraphQL Playground:

`mutation {
    addMovie(movie: {
        title: "2001: A Space Odyssey",
        releaseDate: "1968-05-12"}) {
          id
          title
    }
}`{{copy}}

and execute it by clicking the circled arrow in GraphQL Playground

Let's add another movie. Copy the following mutation into the current tab:

`mutation {
     addMovie(movie: {
         title: "Yellow Submarine",
         releaseDate: "1968-11-13"}) {
           id
           title
     }
 }`{{copy}}

Now go back to the tab in which you registered the subscription, `onMovieAdded`. You should see messaging activity.

Then, come back and copy this query into the browser window to see the movie list:

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
 

