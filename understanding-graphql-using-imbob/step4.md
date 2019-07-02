**This introductory video covers the tasks you'll perform in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/VEmmg5Qcylw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

**The purpose** of this step is to show you how to register to a GraphQL [Subscription](https://graphql.github.io/graphql-spec/June2018/#sec-Subscription) that's published by the 
IMBOB API. Subscriptions are a special feature of the GraphQL specification. Subscriptions make it so that a user
of an API can “subscribe” to a specific event published by a GraphQL API. Then, once the user’s subscription is
registered with the API, the user will receive messages when that event is fired by a particular action, 
usually when a query or mutation is executed upon the API.

**Task 1:** Go the your browser window that has the GraphQL Playground page we called in earlier steps. Create new tab by 
clicking on `New Tab` and the end of line of tabs in the GraphQL Playground window.

**Task 2:** Then add the security authorization token by copy and pasting

`{"authorization": "ch3ddarch33s3"}`{{copy}}

to the HTTP HEADERS section in the lower left of the GraphQL Playground.

Now we're going to register to the `onEventAdded` subscription as shown in the figure below:

![OnEventAdded](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/register-subscription-01.png)


**Task 3** : We'll register the event, `eventAdded` by copying the following
GraphQL `subscription` declaration into the new tab pane and then click the execute arrow in the GraphQL
Playground UI.

`
subscription onEventAdded{
  onEventAdded{
    id  
    name  
    body  
    createdAt  
    storedAt  
  }
}
`{{copy}}

Now that we have the subscription registered, **let's move onto the next ste**p where we'll execute a mutation that
fires off a message to that subscription.

