![Video Under Construction](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/video-under-construction.jpg)
 
 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

Open another new tab in GraphQL Playground.

Add the security access token by copy and pasting

`{"authorization": "ch3ddarch33s3"}`{{copy}}

We're going to execute a GraphQL mutation in this pane 
that will fire the event, `eventAdded` on the server side. This event will be published by the
subscription to which registered in the last step, Step 4.

Copy the following GraphQL `mutation` declaration into the new tab pane and then click the
execute arrow in the GraphQL Playground UI.

`
mutation{
  ping(messageBody: "This is a simple message body."){
    createdAt
    body
    name
    id
  }
}
`{{copy}}

**Understanding This Step**

TO BE PROVIDED