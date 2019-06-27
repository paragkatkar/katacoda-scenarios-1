**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

Open another new tab in GraphQL Playground.

Add the security access token by copy and pasting

`{"authorization": "ch3ddarch33s3"}`{{copy}}

We're going to execute a GraphQL mutation in this pane 
that will fire the event, `onEventAdded` on the server side. This event will be published by the
`onEventAdded` subscription we registered to in the last step, Step 4.

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