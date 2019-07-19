 * **Educational Objective**
 * **What To Expect**
 * **What You Need To Know Before You Start**
 * **Working with GraphQL and IMBOB**
 * **Scenario Contents**
 
------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------
 
<a name="eductional-objective"></a>
## Educational Objective
The purpose of the scenario is to present the demonstration GraphQL API, IMBOB and to show users how to perform the following queries and mutations against the IMBOB demonstration API. 
Also the scenario shows you how to use GraphQL subscriptions and directives.

<a name="what-to-expect"></a>
## What To Expect

After taking this scenario you will be able to:

* To install the IMBOB API in the Katacoda interactive learning environment
* To access an instance of Apollo Server GraphQL Playground bound to the IMBOB API running in the Katacoda interactive learning environment
* To use to the interactive schema documentation published GraphQL Playground
* To learn about the details of the IMBOB API using GraphQL introspection
* To create and implement queries and mutations in GraphQL Query Language against the IMBOB API
* To register subscriptions to the IMBOB API and receive messages asynchronously upon execution of certain mutations
* To apply a GraphQL directive to a mutation in executed against the IMBOB API

<a name="what-you-need"></a>
## What You Need To Know Before You Start

In order to get full benenfit from taking this scenario it's use to have a working understanding
of the syntax of the [GraphQL Query Language](https://graphql.org/learn/). 
Also it's good to have an understanding of the basics GraphQL operations of [query, mutation](https://graphql.org/learn/queries/) and
[subscription](https://www.apollographql.com/docs/react/advanced/subscriptions).

<a name="understanding"></a>
## Working with GraphQL and IMBOB

This scenario published as a custom built API, IMBOB. IMBOB is a GraphQL API built using Apollo 
Server. IMBOB publishs data that presents some basic movie information. The API is scaled
back to show data for only a few movies.

The reason only a few movies are represented is to provide just enough related data to make
the underlying object graph understandable in terms of organization and assocation.

Please be advised that the IMBOB API does provide mutations that allow users to build out the underlying
object graph. However, if a mishap occurs, all that required to reset the scenario and IMBOB to its initial
state is to refresh this web page.

## Source Code

The source code for the IMBOB demonstration GraphQL API used in this scenario can
be found on GitHub [here](https://github.com/reselbob/IMBOB) .

## Scenario Contents

**Step 1** - Setting Up The GraphQL API to Run on Katacoda

**Step 2** - Accessing and Authenticating to the API

**Step 3** - Executing Sample GraphQL Queries

**Step 4** - Registering a Subscription

**Step 5** - Firing a Subscription Event using the Mutation, `Ping`

**Step 6** - Working with `onMovieAdded` to Add Data and Generate Asynchronous Messages

**Step 7** - Declaring a Restricted Field Using a Custom Directive

**Step 8** - Working with Connections