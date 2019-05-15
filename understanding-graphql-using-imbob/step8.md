![Video Under Construction](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/video-under-construction.jpg)
 
 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

CONTENT TO BE PROVIDED

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