<img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="80" alt="under construction" />

**Time to complete step:** TBD

At this point we should have the following activities in play:

* The testing container is continually making `wget` calls to the service, `hpa-demo-web` internally in the kubernetes cluster
* An HPA is in force monitoring the pods in the `hpa-demo-web` deployment

If all goes according to intention, HPA should be spinning up some new pods as the existing pod exceeds it resource allocation.

Let take another look at the status of the running HPA. Execute the following command:

`kubectl get hpa`{{execute}} 


Now, let's apply a Linux `watch` get a continuous update on the Kubernetes pods in play. Execute the following command:

`watch -n 45 "kubectl get pod`{{execute}}

Over time we should see the number of pods increase as the first pod goes beyond it allocation for CPU utilization.

