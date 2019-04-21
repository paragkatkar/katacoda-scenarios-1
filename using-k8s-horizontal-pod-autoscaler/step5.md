**This preview video shows you exactly what you're going to do in this step.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/5SLD598s67Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

------

**IMPORTANT**: You need to have done tasks described previously in Step 4 in order for all the concepts and instructions
in this step to make sense and work. If you have not done Step 4, please go back!

------

**Time to complete step:** 3 Minutes

At this point we should have the following activities in play:

* The testing container is continually making `wget` calls to the service, `hpa-demo-web` internally in the kubernetes cluster
* An HPA is in force monitoring the pods in the `hpa-demo-web` deployment

If all goes according to intention, HPA should be spinning up some new pods as the existing pod exceeds it resource allocation.

Let's wait 60 seconds and then take another look at the status of the running HPA.

Click the following command to view the status of the HPA.

`kubectl get hpa`{{execute T1}} 


Let get a full view of the number of pods in force. Click the following command a list of `hpa-demo-web` pods that are up and
running.

`kubectl get pod | grep hpa-demo-web`{{execute T1}}

And get some output the looks similar to this:

```
NAME                                      READY     STATUS    RESTARTS   AGE
deployment-for-testing-5cf785f6d7-sb2cc   1/1       Running   0          5m
hpa-demo-web-5c4b4789bf-5cgrb             1/1       Running   0          3m
hpa-demo-web-5c4b4789bf-bmq2v             1/1       Running   0          6m
hpa-demo-web-5c4b4789bf-lppwr             1/1       Running   0          3m
hpa-demo-web-5c4b4789bf-z7xgg             1/1       Running   0          3m
```

As you can see, even though we started with a deployment that had a only 1 pod, HPA made it so that we as that single
pod exceeded it resource allocation, HPA created more pods to alleviate the burden.


Pretty cool, huh? HPA does a lot of work and it's built right into Kubernetes! Who could ask for me?

This is the last step in this scenario. Let's continue on the a review.

