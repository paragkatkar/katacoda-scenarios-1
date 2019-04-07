------

**IMPORTANT**: You need to have done tasks described previouly in Step 3 in order for all the concepts and instructions
in this step to make sense and work. If you have not done Step 3, please go back!

------

In this step we're going to go back into the testing service in the cluster From within the cluster, we're going to
create a loop in a bash script that keeps calling the nginx service. The loop will place a burden on the
pods backing the nginx service.


First we need to get back into the cluster. To do this we execute the following command, which you can invoke by
must clicking on the command line text.s

`kubectl exec -i --tty service-for-testing /bin/sh`{{execute}}

Let's create a little looping program in bash and save it to the file, `loops.sh`.

`echo "while true; do wget -q -O- http://nginx.default.svc.cluster.local ; done" > loops.sh`{{execute}}

We need to give it execute permissions, like so:

`chmod +x /loops.sh`{{execute}}

Now, let's run the loop in the background 

`nohup /loops.sh &> /dev/null &`{{execute}}

Right now we are effectively trying to max out the single pod in the nginx service.

**In the next step we'll apply an HPA to the nginx deployment**. Applying the HPA tell Kubernetes to keep an eye
on the pods in the deployment and when the CPU utilization goes beyond a certain threshold, increase the number
of pods backing the service 
\






