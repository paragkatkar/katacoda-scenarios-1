![Video Under Construction](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/video-under-construction.jpg)
 
 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

## Understanding Connections


The concept behind the data graph is that data exists as distinct entities within a domain, with an entity being
structured according to properties (aka, attributes or fields). In addition, an entity can have none, one or 
many relationships to another entity. For example on entity can "know" another entity.


In [discrete mathematics](https://en.wikipedia.org/wiki/Discrete_mathematics), the discipline that gave birth to the concept of
the data graph, we call an entity, a node. A relationship between two nodes is called an edge. IMBOB captures a number of edges that can exist between nodes.


## Using Connections

Let's do a search of Persons, looking for `Nicholas` `Roeg`. 

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

