We need to compile the `.java` file that contains the code that defines the [Java Interface](https://www.w3schools.com/java/java_interface.asp) that the server will implement.

Click the following command to execute the compilation in the Katacoda interactive terminal.


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