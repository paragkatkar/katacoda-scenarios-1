**This introductory video covers the tasks you'll perform in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/0wmU5oFvMZg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Let's set up the GraphQL API.

**Task 1:** Get the code from GitHub:

`git clone https://github.com/reselbob/IMBOB.git`{{execute}}

**Task 2:** Go to the folder that has the source code and Dockerfile

`cd IMBOB`{{execute}}

**Task 3:** Make the Docker image that represents the GraphQL API

`docker build -t imbob .`{{execute}}

**Task 4:** Now, create the container

`docker run -d -p 80:4000 imbob`{{execute}}


Let's check to see that the GraphQL API is up and running

**Task 5:**: Click the following command the verify that the GraphQL API is up and running.

`curl 'http://localhost:80/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'Connection: keep-alive' -H 'DNT: 1' -H 'Origin: http://localhost:80' -H 'authorization: ch3ddarch33s3' --data-binary '{"query":"mutation{\n  ping(messageBody: \"This is a simple message body.\"){\n    createdAt\n    body\n    name\n    id\n  }\n}"}' --compressed`{{execute}}

If all is well you should see a response similar to the following 
(`id` and `createdAt` values will differ by installation.):

```JSON
{"data":{"ping":{"createdAt":"Sun May 12 2019 15:41:37 GMT+0000 (Coordinated Universal Time)",
         "body":"This is a simple message body.",
         "name":"PING",
         "id":"ac4f1d95-88fc-4953-89b2-00b8096dec00"}}}
```

**Understanding This Step**

The purpose of this step was to get the IMBOB API server up and running so that we can experiment with
GraphQL queries, mutations and subscriptions.

**In the next step** we'll be working the GraphQL Playground web page that ships with Apollo server to do work.