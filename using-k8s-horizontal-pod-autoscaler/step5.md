**Time to complete step:** 2 Minutes

------

**IMPORTANT**: You need to have done tasks described previously in Step 4 in order for all the concepts and instructions
in this step to make sense and work. If you have not done Step 4, please go back!

------

In this step we're going to take a look how Kubernetes uses the Horizonal Pod Autoscaler to accommodate increased
loads placed on the pods in a deployment.

Let's open a second terminal window and imperatively create an HPA on the nginx deployment using the `kubectrl autoscale`
command. 

To open a second terminal window, click the `+ ` sign at the top of the Katacoda's interative terminal, as shown in 
the this illustration:

![katacoda second terminal](https://github.com/reselbob/katacoda-scenarios/blob/master/using-k8s-horizontal-pod-autoscaler/assets/step-05-01.png)

Execute the following command to create an HPA against the deployemnt, `nginx`.

`kubectl autoscale deployment nginx --cpu-percent=50 --min=1 --max=5`{{execute}}

The HPA will keep an eye on the pods that are backing the nginx service. We'll set the `--cpu-pecentage` option
on the `kubectrl autoscale` command to a threshold of 50%. Also, we'll tell the HPA to have a mininum of 1 pod running
(`--min=1`), but no more than 5 pods (`--max=5`).

Let's see the status of the Horizontal Pod Autoscaler

| __DEV NOTE:__ | __`hpa` is not yet working. Need to install the appropriate monitor in the Katacoda environment.__                            |
|------------|--------------------------------------------|

As you can see, the HPA is running and we're getting back useful information.

**In the next step we'll take a more in-depth view the behavior of the HPA.**

