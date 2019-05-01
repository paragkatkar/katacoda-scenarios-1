![Video Under Construction](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/video-under-construction.jpg)
 
 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

Go the your browser window that has the GraphQL Playground page we called in earlier steps.

Add the security access token by copy and pasting

{"authorization": "ch3ddarch33s3"}`{{copy}}

to the HTTP HEADERS section in the lower left of the GraphQL Playground

Open a new tab in GraphQL Playground. We'll register the event, `eventAdded` by copying the following
GraphQL `subscription` declaration into the new tab pane and then click the execute arrow in the GraphQL
Playground UI.

`
subscription eventAdded{
  eventAdded{
    id  
    name  
    payload  
    createdAt  
    storedAt  
  }
}
`{{copy}}

**Understanding This Step**

TO BE PROVIDED

