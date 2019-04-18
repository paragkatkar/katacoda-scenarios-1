 <img src="https://drive.google.com/file/d/1q2sQCdOOCni5dv4R0kqFiXGS4RaaIxV4/view?usp=sharing" width="400" alt="Step Video Goes Here" />

First, let's set up the GraphQL API.

Get the code from GitHub:

`git clone https://github.com/reselbob/IMBOB.git`{{execute}}

Go to the folder that has the source code and Dockerfile

`cd IMBOB`{{execute}}

Make the Docker image that represents the GraphQL API

`docker build -t imbob .`{{execute}}

Now, create the container

`docker run -d -p 80:4000 imbob`{{execute}}


Let's check to see that the GraphQL API is up and running

`curl 'http://localhost/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'Connection: keep-alive' -H 'DNT: 1' -H 'Origin: http://localhost:4000' -H 'authorization: ch3ddarch33s3' --data-binary '{"query":"mutation{\n  ping(payload: \"This is a test payload\") {\n    createdAt\n    payload\n    name\n    id\n  }\n}"}' --compressed`{{execute}}

**Understanding This Step**

TO BE PROVIDED