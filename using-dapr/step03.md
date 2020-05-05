## Objective
The objective of this lesson is to exercise the Node.JS application that is running under DAPR.

## Steps

**Step 1:** Invoke an action on the sample Node.JS application

Click the following commands to have the sample Node.JS send data to storage using the command set, `dapr invoke`. (The command will execute in a third terminal window in the Katacoda interactive learning environment.)

`dapr invoke --app-id nodeapp --method neworder --payload '{"data": { "orderId": "41" } }'`{{execute T3}}

`dapr invoke --app-id nodeapp --method neworder --payload '{"data": { "orderId": "42" } }'`{{execute T3}}

`dapr invoke --app-id nodeapp --method neworder --payload '{"data": { "orderId": "43" } }'`{{execute T3}}

**Step 2:** Confirm that the invocation was successful

Click the following command to execute a `curl` command in the third terminal window that the will use the HTTP method `GET` to retrieve order information from the sample Node.JS application.

`curl http://localhost:3500/v1.0/invoke/nodeapp/method/order`{{execute T3}}