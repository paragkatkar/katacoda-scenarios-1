## Objective
The objective of this lesson is to demontrate how to compile the Java code for RMI client.

We need to compile the `.java` file that defines the client that will call the remote method, `echo(String message)` on the Java server we defined in the previous step.

## Steps

**Step 1:** Compile the Java source code for the RMI client

Click the following command to execute the compilation in the Katacoda interactive terminal.

`javac MyClient.java`{{execute}}

## Discussion of Code

`TO BE PROVIDED`

```
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

public class MyClient {

	private static RMIInterface look_up;

	public static void main(String[] args) 
		throws MalformedURLException, RemoteException, NotBoundException {
		
		look_up = (RMIInterface) Naming.lookup("//localhost:5000/MyServer");

		System.out.print("Enter a message: ");
		String input = System.console().readLine();
			
		String response = look_up.echo(input);

		System.out.print(response + "\n");
	}
}
```

