![Video Under Construction](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/video-under-construction.jpg)
 
 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

 <img src="https://drive.google.com/file/d/1q2sQCdOOCni5dv4R0kqFiXGS4RaaIxV4/view?usp=sharing" width="400" alt="Step Video Goes Here" />

Go the your browser window that has the GraphQL Playground page we called in an earlier step.

Open another new tab in GraphQL Playground. We're going to execute a GraphQL mutation in this pane 
that will fire the event, `eventAdded` on the server side. This event will be published by the
subscription to which registered in the last step, Step 4.

Copy the following GraphQL `mutation` declaration into the new tab pane and then click the
execute arrow in the GraphQL Playground UI.

`
mutation{
  ping(payload: This is a simple payload message."){
    createdAt
    payload
    name
    id
  }
}
`{{copy}}

**Understanding This Step**

TO BE PROVIDED