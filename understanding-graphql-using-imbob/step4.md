 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />
------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

Go the your browser window that has the GraphQL Playground page we called in earlier steps.

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

