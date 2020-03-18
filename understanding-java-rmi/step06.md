## Objective
The objective of this lesson is performed the tasks necessary to get Java RMI Server and the client that will communicate with server up and running.

## Steps

**Step 1:**  Click the command below to navigate to the director, `simplermi` in a  second terminal window in the Katacoda interactive learning environment.

`cd  simplermi`{{execute T2}}

**Step 2:**  Click the command below to start the server in the second terminal window.

`java MyServer`{{execute T2}}

You will get response at the command line as follows:

`Server is up and running!`

This terminal is now tied up running the Java RMI server. The following steps will open additional windoes to do work.

**Step 3:**  Click the command below to mavigate to directlry, `simplermi ` in a third terminal window..

`cd  simplermi`{{execute T3}}

**Step 4:**  Then click the following command to invoke the client that will call the remote method.

`java MyClient`{{execute T3}}

You will get a prompt at follows:

`Enter a message: `

**Step 5:** Copy this message into the command prompt to enter a message.

`This is a simple message for RMI`{{copy}}

and then string the `ENTER` key

You will get output at the command line as follows:

`Echoing: This is a simple message for RMI`

**Step 6:** Click the command below to go back to the 

`echo`{{execute T2}}

Notice the following output in the second terminal window

```
Echoing [This is a simple message for RMI] at: Wed Mar 18 19:46:35 UTC 2020
```

This is the response from the server that indicates that it has received a message from the client. And, the response is reporting the time the message was received by the server.

