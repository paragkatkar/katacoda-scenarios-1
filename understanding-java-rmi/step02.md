We need to compile the java file that contains the code the defined the Interface that the server will implement.

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