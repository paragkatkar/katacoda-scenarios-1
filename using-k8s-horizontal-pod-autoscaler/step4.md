**Time to complete step:** 3 Minutes

------

**IMPORTANT**: You need to have done tasks described previously in Step 3 in order for all the concepts and instructions
in this step to make sense and work. If you have not done Step 3, please go back!

------

In this step we're going to go back into the cluster by way of a pod in the testing deployment we created earlier.
Then, from within the cluster, we're going to create a loop in a bash script that keeps calling the nginx service.
The loop will place a burden on the pods backing the nginx service.

We need to get back into the cluster. The first thing we need to do is to find a pod that is part of
the deployment, `deployment-for-testing`. To do this, we'll get a list of all pods that start with the prefix,
`deployment-for-testing`. (When you create a deployment, Kubernetes will automatically create the pods and start the
name of each pod with the name of the deployment.)

Execute the command, 

`kubectl get pods | grep deployment-for-testing`{{execute}}

The command output will show the pods in the deployment like so:

```
master $ kubectl get pods | grep deployment-for-testing
|NAME                                   READY     STATUS    RESTARTS   AGE
deployment-for-testing-5f8b464b59-rk96v   1/1       Running   1          14m
```
**WHERE**

`deployment-for-testing-5f8b464b59-rk96v`

is a special pod name, unique to the installation.

Then once you've identified a pod, use the `kubectl exec` command to access the pod, like so, by typing the following
into the Katacoda interactiver terminal.

`kubectl exec -it deployment-for-testing-5f8b464b59-rk96v /bin/sh`

**Note:** *You'll need to work directly at the command line because each installation's pod names will be special.*

Now that you are in the cluster, let's create a little looping program in bash and save it to the file, `loops.sh`.

`echo "while true; do wget -q -O- http://hpa-demo-web.default.svc.cluster.local ; done" > loops.sh`{{execute}}

We need to give it execute permissions, like so:

`chmod +x /loops.sh`{{execute}}

Now let's put some burden on the nginx pod and run the loop in the background 

`sh /loops.sh`{{execute}}

Right now we are effectively trying to max out the single pod in the nginx service.

**In the next step we'll apply an HPA to the `hpa-demo-web` deployment**. Applying the HPA tells Kubernetes to keep an eye
on the pods in the deployment and when the CPU utilization goes beyond a certain threshold, increase the number
of pods backing the service.






