![Video Under Construction](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/video-under-construction.jpg)
 
  <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />
 ------
 
 **IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
 consistent. Otherwise, you'll get behaviors that might be confusing.
 
 ------

If you do not have the GraphQL Playground for the IMBOB API in a brower window, go to the following URL

Go to the link below to bring the GraphQL Playground up in your browser:
 
 https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`
 
## Simple Query

 Let's do a simple query. Enter the following GraphQL code in the Query pane of the GraphQL Playground, or do
 a copy and paste from the clipboard to the GraphQL Playground.
 
 `
 {
   movies {
     title
     releaseDate  
     actors{
       firstName  
       lastName  
     }
     directors{
       firstName  
       lastName  
     }
   }
 }`{{copy}}
 
**Understanding This Step**


## Query with Pagination

First Query

`
{
  persons(paginationSpec:{first:5, 
                          sortFieldName:"lastName",       
                          }){
    pageInfo{
      endCursor
      hasNextPage
    }
    collection{
      firstName
      lastName
      id
    }
  }
} 
`{copy}}

Result

```JSON
{
  "data": {
    "persons": {
      "pageInfo": {
        "endCursor": "ad382532-4d32-4bbe-b3ea-69213be4703a",
        "hasNextPage": true
      },
      "collection": [
        {
          "firstName": "Ben",
          "lastName": "Affleck",
          "id": "b026dd59-98e1-46ac-9ade-5d8794265599"
        },
        {
          "firstName": "Casey",
          "lastName": "Affleck",
          "id": "68db2026-1d6c-4e27-abdb-43994d517513"
        },
        {
          "firstName": "Roslyn",
          "lastName": "Armstrong",
          "id": "7f1e7daf-376b-4a0d-937f-2d2d09c290f6"
        },
        {
          "firstName": "Hal",
          "lastName": "Ashby",
          "id": "b5f0b9da-8ed1-4743-920e-f85d78a62131"
        },
        {
          "firstName": "Anthony",
          "lastName": "Asquith",
          "id": "ad382532-4d32-4bbe-b3ea-69213be4703a"
         }
         ]
     }
  }
 }
```

Second query


`
{
  persons(paginationSpec:{first:5, 
                          sortFieldName:"lastName",
                          after: "ad382532-4d32-4bbe-b3ea-69213be4703a"      
                          }){
    pageInfo{
      endCursor
      hasNextPage
    }
    collection{
      firstName
      lastName
      id
    }
  }
} 
`{copy}}

Result

```JSON
{
  "data": {
    "persons": {
      "pageInfo": {
        "endCursor": "5130acee-21fe-48bf-a06f-c8bdcb38ea60",
        "hasNextPage": true
      },
      "collection": [
        {
          "firstName": "Brando",
          "lastName": "Bartell",
          "id": "9eb66b6f-5871-4b53-8bcb-64e8ac7586b4"
        },
        {
          "firstName": "Brant",
          "lastName": "Beatty",
          "id": "63712db4-9350-44e3-a934-2e836e6ae078"
        },
        {
          "firstName": "Ezekiel",
          "lastName": "Bechtelar",
          "id": "db410a31-2d68-440e-9b96-6585aeee8717"
        },
        {
          "firstName": "John",
          "lastName": "Bindon",
          "id": "2d97f15b-c069-4cd3-a640-8792e28fe48c"
        },
        {
          "firstName": "David",
          "lastName": "Bowie",
          "id": "5130acee-21fe-48bf-a06f-c8bdcb38ea60"
        }
      ]
    }
  }
}
```