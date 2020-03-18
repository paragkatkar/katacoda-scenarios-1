We need to compile the java file that defines the server that contains the remote method, `echo(String message)`that will be called by the client.

Click the following command to execute the compilation in the Katacoda interactive terminal.

`javac MyServer.java`{{execute}}

## Discussion of Code

```
import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class MyServer extends UnicastRemoteObject implements RMIInterface{

    private static final long serialVersionUID = 1L;

    protected MyServer() throws RemoteException {

        super();

    }

    @Override
    public String echo(String message) throws RemoteException{

        System.err.println("[" + message + "] is trying to make a connection!");
        return "Echoing: " + message;

    }

    public static void main(String[] args){

        try {

            Naming.rebind("//localhost:5000/MyServer", new MyServer());            
            System.err.println("Server is up and running!");

        } catch (Exception e) {

            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();

        }

    }

}
```

