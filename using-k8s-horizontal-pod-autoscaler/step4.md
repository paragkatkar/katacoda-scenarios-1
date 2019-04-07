**IMPORTANT**: You need to have done tasks described previouly in Step 3 in order for all the concepts and instructions
in this step to make sense and work. If you have not done Step 3, please go back!

Let's create a little looping program in bash and save it to the file, `loops.sh`.

`echo "while true; do wget -q -O- http://nginx.default.svc.cluster.local ; done" > loops.sh`{{execute}}

We need to give it execute permissions, like so:

`chmod +x /loops.sh`{{execute}}

Now, let's run the loop in the background and then check the state of the pods

`nohup /loops.sh &> /dev/null &`{{execute}}


Let's exit of out the container so what can can see the big picture

`exit`{{execute}}

Now let's do an autoscale

`kubectl autoscale deployment nginx --cpu-percent=50 --min=1 --max=5`{{execute}}


`kubectl get hpa`{{execute}}






