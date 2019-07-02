**This introductory video covers the tasks you'll perform in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/jgmfApIVYIU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

## Understanding Nodes and Edges

A [graph](https://en.wikipedia.org/wiki/Graph_(discrete_mathematics) (also known as an object graph or data graph) is
the foundation on which data is organized and represented in GraphQL. 

The concept behind a graph is that data exists as distinct entities within a domain, with an entity being
structured according to properties (aka, attributes or fields). In addition, an entity can have none, one or 
many relationships to another entity. For example one entity can "know" another entity.

![Knows Edge](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/knows-edge.png)


In [discrete mathematics](https://en.wikipedia.org/wiki/Discrete_mathematics), the discipline that gave birth to the concept of
the graph, we call an entity, a `node`. A relationship between two nodes is called an [`edge`](https://en.wikipedia.org/wiki/File:Undirected.svg).

IMBOB captures a number of edges that can exist between nodes. For example, one node (aka entity) can have both "knows"  
and "likes" edges with another node.
                                                               
![Knows Likes Edge](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/likes-knows-edge.png)
 
Yet, another node might have only a "knows" edge with the same node.

![Person C only likes Person B](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/person-c-likes-only.png)

## Understanding Connections in GraphQL

Many GraphQL APIs refer to an edge as a `connection`. Describing an edge as a connection is a convention that's evolved
among the GraphQL community. For example,  IMBOB describes a `likes` relationship as a `likesConnection`.

![Likes Connection](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/likesConnection.png)


The important thing to understand about connections in IMBOB is that data that's returned is an array of `PersonConnection`
objects. `PersonConnection`is made up of two fields, `pageInfo` and `edges`

------

**WHERE**

**`pageInfo`** contains information required for queries to support pagination

**`edges`** contains an array of `PersonEdge` objects. `PersonEdge` publishes two fields, the `cursor` that identifies
the given `PersonEdge` object in and entire list of `PersonEdge` objects  and the `Person` object which contains the actual
data about th person. 

------

The reason a `PersonEdge` object is used is because a `likeConnection` might container hundreds, if not thousands
of edges. Thus, we need to have the `likesConnection` query support pagination. In order to support pagination
the query needs the `cursor` information provide by `PersonEdge`.

![Like Connection Documentation](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/likes-collection-doc.png)



The exercise that follows demonstrates how to query IMBOB to get the `likesConnection` of a particular person, in this case
`Nicholas Roeg`.

## Using Connections

Let's do a search of Persons, looking for `Nicholas` `Roeg` using the query, `searchPerson`.

The search query we'll run looks like this:

`
{
  searchPerson(firstName: "Nicholas", lastName: "Roeg") {
    pageInfo {
      hasNextPage
    }
    collection {
      firstName
      lastName
      likesConnection {
        pageInfo {
          hasNextPage
        }
        edges {
          node {
            firstName
            lastName
          }
          cursor
        }
      }
    }
  }
}
`



First let's do the search using `curl`.

**Task 1:** Click the following `curl` command to search IMBOB for `Nicholas` `Roeg` in the terminal window.

`
curl 'http://localhost:80/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'Connection: keep-alive' -H 'DNT: 1' -H 'Origin: http://localhost:80' -H 'authorization: ch3ddarch33s3' --data-binary '{"query":"{\n  searchPerson(firstName: \"Nicholas\", lastName: \"Roeg\") {\n    pageInfo {\n      hasNextPage\n    }\n    collection {\n      firstName\n      lastName\n      likesConnection {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          node {\n            firstName\n            lastName\n          }\n          cursor\n        }\n      }\n    }\n  }\n}\n"}' --compressed
`{{execute}}

You'll get a response similar to following:

`
{"data":{"searchPerson":{"pageInfo":{"hasNextPage":false},"collection":[{"firstName":"Nicholas","lastName":"Roeg","likesConnection":{"pageInfo":{"hasNextPage":false},"edges":[{"node":{"firstName":"David","lastName":"Bowie"},"cursor":"5130acee-21fe-48bf-a06f-c8bdcb38ea60"},{"node":{"firstName":"Candy","lastName":"Clark"},"cursor":"3079bcad-dc93-4251-8da2-31a8b40fd54d"},{"node":{"firstName":"Mick","lastName":"Jagger"},"cursor":"a19e2057-2530-44c9-a8ce-869ede85acc7"},{"node":{"firstName":"Susan","lastName":"Stephen"},"cursor":"df501309-f168-44f8-b53b-0859dc621abe"}]}}]}}}
`

Now, let do the search in a new tab in the GraphQL Playground web page.
 
**Task 2:** Open a new tab in GraphQL Playground.
![](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/new-tab-button.png)

**Task 3:** Once in GraphQL Playground of IMBOB, add the following authorization JSON to the HTTP Headers
pane on the lower left of the Web Page, as shown in the illustration below.

![Authorization JSON](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/graphql-authorization-only.png)
  
  
You can copy the Authorization JSON by clicking on the copy icon and then pasting it into the UI directly.            
`
{"authorization":"ch3ddarch33s3"}`{{copy}}



**Task 4:** Copy the following query into the query panel as shown in the illustration below:

![Search Query](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/graphql-search-query.png)

`
{
  searchPerson(firstName: "Nicholas", lastName: "Roeg") {
    pageInfo {
      hasNextPage
    }
    collection {
      firstName
      lastName
      likesConnection {
        pageInfo {
          hasNextPage
        }
        edges {
          node {
            firstName
            lastName
          }
          cursor
        }
      }
    }
  }
}
`{{copy}}

You should get a result that looks similar to the one below

`
{
  "data": {
    "searchPerson": {
      "pageInfo": {
        "hasNextPage": false
      },
      "collection": [
        {
          "firstName": "Nicholas",
          "lastName": "Roeg",
          "likesConnection": {
            "pageInfo": {
              "hasNextPage": false
            },
            "edges": [
              {
                "node": {
                  "firstName": "David",
                  "lastName": "Bowie"
                },
                "cursor": "5130acee-21fe-48bf-a06f-c8bdcb38ea60"
              },
              {
                "node": {
                  "firstName": "Candy",
                  "lastName": "Clark"
                },
                "cursor": "3079bcad-dc93-4251-8da2-31a8b40fd54d"
              },
              {
                "node": {
                  "firstName": "Mick",
                  "lastName": "Jagger"
                },
                "cursor": "a19e2057-2530-44c9-a8ce-869ede85acc7"
              },
              {
                "node": {
                  "firstName": "Susan",
                  "lastName": "Stephen"
                },
                "cursor": "df501309-f168-44f8-b53b-0859dc621abe"
              }
            ]
          }
        }
      ]
    }
  }
}
`

