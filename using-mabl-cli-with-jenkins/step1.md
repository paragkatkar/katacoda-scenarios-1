**Objective:** The objective of this step is to install a special version of Jenkins that is configured with the [mabl CLI](https://help.mabl.com/docs/mabl-cli) tool. The Jenkins server is named, `mablJenkins` and runs as a container under Docker.

**Step 1:** Clone the `mablJenkins` repository code

`git clone https://github.com/reselbob/mabljenkins.git`{{execute}}

**Step 2:** Go to the project's directory

`cd mabljenkins`{{execute}}

**Step 3:** Build the container image locally.

`docker build -t mabljenkins:v1 .`{{execute}}

**Step 4:** Create the container based on the local Docker image, making the host's version of Docker available to the Jenkins container

`docker run --name jenkins -d -p 80:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker mabljenkins:v1`{{execute}}

**Step 5:** Confirm the `docker` container is running:

`docker ps -a`{{execute}}

You'll output that is similar to, but not exactly like the following:

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                       NAMES
177b9fe064b7        mabljenkins:v1      "/sbin/tini -- /usr/…"   24 seconds ago      Up 24 seconds       0.0.0.0:50000->50000/tcp,0.0.0.0:80->8080/tcp   jenkins
```

**Step 6:** Confirm that the `mabl CLI tool` is running within the `mablJenkins` container.

`docker exec -it jenkins mabl --version`{{execute}}

You'll get output similar to the following. But, your version might be different depending on when you run this `mablJenkins` setup.

`0.5.7-beta`

**Step 7:** Bring up the `mablJenkins` server Web UI

Click on the tab labeled, `mablJenkins` in the horizontal menu bar of the Katacode interactive environment pane.

![mablJenkins](https://katacoda.com/reselbob/scenarios/using-mabl-cli-with-jenkins/assets/select-mabl-tab.png)

**BE ADVISED:Sometimes it might take a minute or two for the Jenkins server to become operational under Katacoda. So, you might have to try the following step two, three or sometimes even four times.** 

You'll be presented the Katacoda page that that has the button labeled, `Display Port` as shown in the figure below.

![mablJenkins](https://katacoda.com/reselbob/scenarios/using-mabl-cli-with-jenkins/assets/select-port-80-b.png)

Click the button.

**Step :** Login to the Jenkins web server.

After you click the `Display Port` button as described above in Step 6, you'll login to the Jenkins web server as shown in the figure below.

![mablJenkins](https://katacoda.com/reselbob/scenarios/using-mabl-cli-with-jenkins/assets/login-jenkins-b.png)

The access credentials are as follows:

User name: `admin`

Password: `admin`


Then, check the checkbox labeled, `Keep me signed in` and click the button labeled, `Sign in`.

The Jenkins main home page will appear, as shown in the figure below.

![mablJenkins](https://katacoda.com/reselbob/scenarios/using-mabl-cli-with-jenkins/assets/jenkins-main-page.png)


**Congratulations!** You have Jenkins Server up and running with the `mabl CLI tool` installed.
