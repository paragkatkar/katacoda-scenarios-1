## Objective
The objective of this lesson is to get a sample Node.JS application up and running under DARP

## Steps

**Step 1:** Get the code

Click the following command to clone this scenario's sample code down from GitHub in a second terminal window in the Katacoda interactive learning environment.

`git clone https://github.com/dapr/samples.git`{{execute T2}}

**Step 2:** Go to the working directory

Click the following command to navigate to the working directory that contains the code you'll use to create invoke the Node.JS application under DAPR.

`cd samples/1.hello-world`{{execute T2}}

**Step 3:** Install the sample Node.JS application

`npm install`{{execute T2}}

**Step 4:** Start the Node.JS application under DAPR

`dapr run --app-id nodeapp --app-port 3000 --port 3500 node app.js`