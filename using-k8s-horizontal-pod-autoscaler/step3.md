TO BE PROVIDED

First, let's create a deployment that uses an nginx web server.

`kubectl run nginx --image=nginx --requests=cpu=500m,memory=500M --expose --port=3000`{{execute}}

