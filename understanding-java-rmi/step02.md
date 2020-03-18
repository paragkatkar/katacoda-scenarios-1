## Objective
The objective of this lesson is to demontrate how to compile the Java code for [Java Interface](https://www.w3schools.com/java/java_interface.asp) `RMIInterface`.

## About `java.rmi.Remote`

The Java RMI framework requires that developers create an interface that defines the methods that will be made avaiable to external clients via Java RMI. Such an interface needs to extend the interface [`java.rmi.Remote`](https://docs.oracle.com/javase/7/docs/api/java/rmi/Remote.html). Once the interface is defined it will be implemented in the RMI server.

## Steps

**Step 1:** Compile the inteface code

Click the following command to compile the code for the `RMIInterface.java` into a `.class` file.


`javac RMIInterface.java`{{execute}}

## Discussion of Code

`TO BE PROVIDED`

```
import java.rmi.Remote;
import java.rmi.RemoteException;

public interface RMIInterface extends Remote {

    public String echo(String message) throws RemoteException;

}
```