TO BE PROVIDED

First, let's create a deployment that uses a custom container that is a Node.js application that
does nothing more the return some runtime information about the computing environment.

The container image is out on Docker Hub, at https://hub.docker.com/r/reselbob/pinger.

`run pinger --image=reselbob/pinger --requests=cpu=500m,memory=100M --expose --port=3000`{{execute}}

