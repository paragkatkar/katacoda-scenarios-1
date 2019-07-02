**This introductory video covers the tasks you'll perform in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/zAlWUBKca8g" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

CONTENT TO BE PROVIDED

In this step we're going to examine how to use a custom GraphQL directive, `@requiresPersonalScope`.

You can think of a directive as way by which a developer can go into existing GraphQL
type definition source code and “mark” it so that a rule is applied to a type or
one of its fields. Of course, a developer must be actually program behavior for the
defined directive somewhere in the API code.

In this case, the developer applied the directive, `@requiresPersonalScope` to the `email` field in the
`Person` type as shown below:

```text
type Person implements Personable{
  id: ID
  firstName: String
  lastName: String
  dob: Date
  email: String @requiresPersonalScope
}
```

Applying the directive makes it so that only users who have permission to view person information
can view email addresses. Otherwise, an error message indicating that user does not have permission to the view
the field information will be displayed.

**NOTE:** Be advised that the code for the rule logic for the directive, can be found in the custom module, `directives.js` that can
be found [here](https://github.com/reselbob/IMBOB/blob/master/graphql/directives.js) in the GitHub repository for the
demonstration application IMBOB.

First, let take a look at what happens when a user who does NOT have permission to view personal information runs a 
query that includes an email field.

**Task 1:** In a separate browser window, go to GraphQL Playground as this URL:

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com

**Task 2:** in the HTTP headers pane, enter the following access credential:

`{"authorization":"ch3ddarch33s3"}`{{copy}}

**Task 3:** Enter the following query in the main query pane:

`
{
  person(id:"ad382532-4d32-4bbe-b3ea-69213be4703a"){
    firstName
    lastName
    email
  }
}`{{copy}}

**Task 4:** Run the query

You should see a result in which the email field is looks like the following:

`"email": "You are not authorized to view personal information"`

![Directive No Permission](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/directive-no-permission.png)

**Task 5:** Now, let's change the user to one who has permission to read personal information. Change the
authentication header in the HTTP Headers pane to have the following user token.

`{"authorization":"s!ssch33s3"}`{{copy}}

The user associated with token, `s!ssch33s3` does indeed have permission to access personal information.

(Please be advised the the logic behind permissions assignment by token is part of the
internals of the IMBOB demonstration project.

GraphQL security is a more complex topic than what is presented here. The authentication method used is rudimentary and meant for
demonstration purposes only. Authentication in real-world applications is much more involved.)

**Task 6:** Run the query again. Now you should see the email address in the person query.

`
{
  "data": {
    "person": {
      "firstName": "Anthony",
      "lastName": "Asquith",
      "email": "Anthony.Asquith@saul.info"
    }
  }
}
`

![Directive Permission](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/directive-permission.png)


Now that we've covered `directives`, let's move onto the way IMBOB implements connections. Connection are a convention that's
evolved with in the GraphQL community as a way to describe relationships between objects within a GraphQL API.