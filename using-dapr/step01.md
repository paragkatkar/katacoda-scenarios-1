## Objective
The objective of this lesson is to get the DAPR CLI installed and running under the Katacoda interactive learning environment
## Steps

**Step 1:** Install Redis

`sudo apt update && apt install redis-tools -y`{{execute}}

**Step 2:** Get the code and install it

Click the following command to download and install the DAPR CLI using `curl`.

`curl -fsSL https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | /bin/bash`{{execute}}

**Step 3:** Initialize DAPR within the Katacoda virtual machine


`dapr init`{{execute}}