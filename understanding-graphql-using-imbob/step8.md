![Video Under Construction](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/video-under-construction.jpg)
 
 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

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
pane on the lower left of the Web Page 
            
`
{"authorization":"ch3ddarch33s3"}`{{copy}}

**Task 4:** Copy the following query into the 

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

Result

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