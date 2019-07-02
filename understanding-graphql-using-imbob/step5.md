**This introductory video covers the tasks you'll perform in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/5I1tGhv6tCY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

**Task 1:** Open another new tab in GraphQL Playground.

**Task 2:** Add the security access token by copy and pasting

`{"authorization": "ch3ddarch33s3"}`{{copy}}

We're going to execute a GraphQL mutation in this pane 
that will fire the event, `onEventAdded` on the server side. This event will be published by the
`onEventAdded` subscription we registered to in the last step, Step 4.

**Task 3:** Copy the following GraphQL `mutation` declaration into the new tab pane and then click the
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

You have now executed the mutation, `ping`. Also, `ping` is programmed on the server-sice to fire an message to the
`onEventAdded` subscription.

**Task 4:** Go back to the `onEventAdded` tab in the GraphQL Playground UI. You will see in the tab a new
message from IMBOB that relates to them mutation `ping`.