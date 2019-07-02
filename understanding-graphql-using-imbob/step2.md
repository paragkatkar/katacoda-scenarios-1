**This introductory video covers the tasks you'll perform in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/XTJHpSs0B00" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

In this step we're going to configure the GraphQL Playground with
the authentication password that IMBOB requires for access to the API. 

**Task 1:** Go to the URL shown below to bring the GraphQL Playground up in your browser. Copy the URL in the address the browser's
address bar.

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com

**Task 2:** Then, once in GraphQL Playground of IMBOB, add the following JSON

`{"authorization":"ch3ddarch33s3"}`{{copy}}

to the HTTP Headers section in the lower left of GraphQL Playground as shown the following figure:
 
![Authenticate to GraphQL](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/graphql-authorization-01.png)
 
This will authenticate your session the IMBOB API. Now you can do some work.

**Let's move onto the next step** where you'll learn how to execute simple and complex queries against the IMBOB API
using the GraphQL Query Language in GraphQL Playground.
