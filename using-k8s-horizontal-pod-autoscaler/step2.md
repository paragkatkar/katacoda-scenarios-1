
**This preview video shows you exactly what you're going to do in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/HyNvJIAh5cs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------

**Time to complete step:** 4 Minutes

First, we need to clear the screen of your interactive learning environment so that you can view
your work in an uncluttered manner.


`clear`{{execute}}

The objective now is to create the single pod deployment (and service) to which we're going to apply Horizontal
Pod Autoscaling (HPA). Also, we'll bind a Kubernetes service to the deployment.

We'll use the Kubernetes `kubectl run` command to spin up a single pod deployment. The pod will have a web server
application that does nothing more than response `OK!` when a request is made.

Execute the following command to create the deployment which we'll name, `hpa-demo-web`.

`kubectl run hpa-demo-web --image=k8s.gcr.io/hpa-example --requests=cpu=200m --port=80 --replicas=1`{{execute}}

The command shown above will get the web application container image from Google Cloud.

Let's make sure the pod is running by executing the following command:

`kubectl get pod | grep hpa-demo-web`{{execute}}

You should see something like this:

Next, let's start a service that uses the deployment:

`kubectl expose deployment hpa-demo-web --type=NodePort`{{execute}}

Let's check the service is running:

`kubectl get service | grep hpa-demo-web`{{execute}}

**The next step** is to create stress on the single pod of the web server application we've just created.