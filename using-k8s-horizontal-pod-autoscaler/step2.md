**Time to complete step:** 2 Minutes

First, we need to clear the screen of your interactive learning environment so that you can view
your work in an uncluttered view.


`clear`{{execute}}

Next, let's get a sense of the number of [nodes](https://kubernetes.io/docs/concepts/architecture/nodes/) in Kubernetes cluster that was created automatically for
you by the interactive learning environment. (You can type the command below into the interactive terminal,
or simple click the command directly with your mouse.)

`kubectl get nodes`{{execute}}

Next, take a look at the [pods](https://kubernetes.io/docs/concepts/workloads/pods/pod-overview/) in the `default` [namespace](https://kubernetes.io/docs/tasks/administer-cluster/namespaces-walkthrough/) of Kubernetes. (You can type the command below into the interactive terminal,
 or simple click the command directly with your mouse.)
`kubectl get pods`{{execute}}

Notice there are no pods installed. Let's take a look the [deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/).
(You can type the command below into the interactive terminal,
 or simple click the command directly with your mouse.) 

`kubectl get deployments`{{execute}}

As you can see, there are no deployments either.

The next step is to create a deployment that will run under a Kubernetes Horizontal Pod Autoscaler. Click the Continue button shown below to continue.