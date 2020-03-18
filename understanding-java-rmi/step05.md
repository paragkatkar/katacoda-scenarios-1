## Objective 

The objective of this lesson is to get the [remote object registry](https://docs.oracle.com/javase/7/docs/technotes/tools/solaris/rmiregistry.html) up and running. The registry is invoked by using the command, `rmiregistry`.

The remote object registry is the mechanism the binds objects that contain methods that can be called remotely on the server. Binding takes place according to name of the server class. This is the code in the RMI Server that binds the RMI server to the registry,

```
 Naming.rebind("//localhost:5000/MyServer", new MyServer()); 
```

This is the line of code in the client that queries the remote object registry for an object, `MyServer` and assign a reference to that object to the variable, `look_up`.

```
look_up = (RMIInterface) Naming.lookup("//localhost:5000/MyServer");
```

Later on the client will call the remote method, `echo`, using this statement:

```
String response = look_up.echo(input);
```

The default port on which the remote object registry listens for incoming request on the server is `1099`. However, in this scenario you will bind to port `5000` in accordance with the lookup code defined above.


## Invoking the Registry 

lick on the following command to get the remote object registry up and running


`rmiregistry 5000`{{execute}}