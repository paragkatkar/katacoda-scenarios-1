**This introductory video covers the tasks you'll perform in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/Bkbee5LYVFE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
 consistent. Otherwise, you'll get behaviors that might be confusing.
 
 ------

If you do not have the GraphQL Playground for the IMBOB API in a brower window, enter the following URL in
your browser's address bar.

 
 https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`
 
The purpose of this step is to have you execute a simple query against the IMBOB API in GraphQL Playground. Also, you'll
execute a more complex query that uses pagination.
 
## Executing a Simple Query

Let's do a simple query of the IMBOB API. In this task we're going to execute the query, `movies` to get a
list of all movies stored in the API.

One of the key benefits of GraphQL is that you can declare only the fields you want in the JSON that gets
returned from a particular query. In this case, we're going to declare the following fields for the query to return.

* title
* releaseDate
* actors
* directors

As you can see in the figure below, the fields, `actors` and `directors` represent arrays of `actor` and`person`
objects respectively.

 ![Movies Query](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/movies-query-01.jpg)
 
Thus, we need to define in the GraphQL query exactly the fields of interest in each array. For both `actors` and 
`directors `we're interested in `firstName` and `lastName`. 

We define such as query the GraphQL Query Language like so:
 
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
 
 
**Task 1:** Copy the `movies` query shown above into GraphQL Playground to execute the query. (An example is shown in the
figure below.)

![Movies Query Result](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/movies-query-exec-01.png)

## Executing a Query with Pagination

In the real world, most clients using GraphQL will be working with arrays of data that are very big. 
The alternative is to get the information you need in chunks, from a particular starting point. This technique is called pagination.

 Pagination is not built in not part of the specification. But, most APIs create implementations that their own pagination mechanisms.
 
 The way IMBOB supports pagination is by way of a special object, `CursorPaginationInput`, which is the type associated'
 with the query parameter, `paginationSpec`. The `persons` query shown below configures an implicit `CursorPaginationInput` object
 to return the first 5 objects starting at the beginning of the server-sid list of `person`
 objects, and sort according to `lastName`.
  
**Task 2:** Execute the query below by typing or copying it into the query panel of the GraphQL Playground instance you
have running in your browser.
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
`{{copy}}

You should see the results like the following. Play attention to the field, `pageInfo`.

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

The field, `pageInfo` shown in the return value above reports the current state of your pagination activity. Effectively
what `pageInfo` is reporting is `endCursor`, which is the `id` of the last `person` in the returned list. Also, `pageInfo`
reports that there are more items to be retrieved, (` "hasNextPage": true`).

Thus, we use this information to configure the `paginationSpec: CursorPaginationInput` parameter when we re-query
`persons` for more data. Notice that we set the value of `after` to `ad382532-4d32-4bbe-b3ea-69213be4703a`. Effectively
we're telling IMBOB to get the first 5 persons in the last starting after the person with the `id` `ad382532-4d32-4bbe-b3ea-69213be4703a`

**Task 3:** Execute the query `persons` again according the new pagination information by entering or copying the following
GraphQL query into the query panel of GraphQL Playground.

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
`{{copy}}

You should get results as shwon below. Notice that this new query returns values starting with the last name of `B`,
while the previous query returned last name values starting with `A`. This is pagination in action.

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

**Please be advised** that the `CursorPaginationInput` the define pagination input and`PageInfo` that define the pagination
state of the current query session are special to IMBOB. Different APIs will have pagination structures that meet their
special requirements.

Now what we have a basic idea how to use the GraphQL Query language, **let's move onto the next step** where you'll learn
how to register to a GraphQL [subscription](https://graphql.github.io/graphql-spec/June2018/#sec-Subscription) on IMBOB to create a
[websocket](https://en.wikipedia.org/wiki/WebSocket) connection and then receive messages
asynchronously when a query or mutation associated with a particular subscription is executed.