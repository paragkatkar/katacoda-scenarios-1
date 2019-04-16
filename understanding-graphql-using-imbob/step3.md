------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

If you do not have the GraphQL Playground for the IMBOB API in a brower window, go to the following URL

Go to the link below to bring the GraphQL Playground up in your browser:
 
 https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`
 
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
 }
 `{{copy}}