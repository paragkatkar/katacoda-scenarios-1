## Objective
The objective of this lesson is to demontrate how to compile the Java code for `RMIInterface.java`.

We need to compile the `.java` file that contains the code that defines the [Java Interface](https://www.w3schools.com/java/java_interface.asp) that the server will implement.

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