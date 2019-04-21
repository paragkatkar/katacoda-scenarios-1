<img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="80" alt="under construction" />

**Time to complete step:** 2 Minutes

------

**IMPORTANT**: You need to have done tasks described previously in Step 4 in order for all the concepts and instructions
in this step to make sense and work. If you have not done Step 4, please go back!

------
At this point we should have the following activities in play:

* The testing container is continually making `wget` calls to the service, `hpa-demo-web` internally in the kubernetes cluster
* An HPA is in force monitoring the pods in the `hpa-demo-web` deployment

If all goes according to intention, HPA should be spinning up some new pods as the existing pod exceeds it resource allocation.

Let take another look at the status of the running HPA. Execute the following command:

`kubectl get hpa`{{execute}} 


Now, let's apply a Linux `watch` get a continuous update on the Kubernetes pods in play. Execute the following command:

`watch -n 45 "kubectl get pod"`{{execute}}

Over time we should see the number of pods increase as the first pod goes beyond it allocation for CPU utilization.

And get some output the looks like this:

```
NAME                                      READY     STATUS    RESTARTS   AGE
deployment-for-testing-5cf785f6d7-sb2cc   1/1       Running   0          5m
hpa-demo-web-5c4b4789bf-5cgrb             1/1       Running   0          3m
hpa-demo-web-5c4b4789bf-bmq2v             1/1       Running   0          6m
hpa-demo-web-5c4b4789bf-lppwr             1/1       Running   0          3m
hpa-demo-web-5c4b4789bf-z7xgg             1/1       Running   0          3m
```

When you are through observing the `watch`, type <kbd>Ctrl</kbd>+<kbd>C</kbd>

As you can see, even though we started with a deployment that had a only 1 pod, HPA made it so that we as that single
pod exceeded it resource allocation, HPA created more pods to alleviate the burden.


Pretty cool, huh? HPA does a lot of work and it's built right into Kubernetes! Who could ask for me?

This is the last step in this scenario. Let's continue on the a review.

