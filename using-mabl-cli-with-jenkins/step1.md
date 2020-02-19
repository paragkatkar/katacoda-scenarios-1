**Objective:** The objective of this step is to install a special version of Jenkins that is configured with the [mabl CLI](https://help.mabl.com/docs/mabl-cli) tool. The Jenkins server is named, `mablJenkins` and runs as a container under Docker.

**Step 1:** Clone the `mablJenkins` repository code

`git clone https://github.com/reselbob/mabljenkins.git`{{execute}}

**Step 2:** Go to the project's directory

`cd mabljenkins`{{execute}}

**Step 3:** Build the container image locally.

`docker build -t mabljenkins:v1 .`{{execute}}

**Step 4:** Create the container based on the local Docker image, making the host's version of Docker available to the Jenkins container

`docker run --name jenkins -d -p 80:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker mabljenkins:v1`{{execute}}

**Step 5:** Confirm the `docker` command works from inside the Jenkins container

`docker exec -it jenkins docker ps`{{execute}}

You'll output that is similar to, but not exactly like the following:

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                       NAMES
177b9fe064b7        mabljenkins:v1      "/sbin/tini -- /usr/…"   24 seconds ago      Up 24 seconds       0.0.0.0:50000->50000/tcp,0.0.0.0:80->8080/tcp   jenkins
```

**Step 6:** Get the initial login ID that you'll need to access Jenkins

`docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword`{{execute}}

You'll output that is similar to, but not exactly like the following:

`4b36a89b91a24c51a5d4042433c013e2`

**SAVE THE LOGIN ID. You're going to need it when you enter the Jenkins server UI for the first time.**

**Step 7:** Bring up the mablJenkins server Web UI

Now that the mablJenkins server is up and running you're going to complete the rest of the scenario by working directly in the Jenkins Web UI.

Click the link below to bring up the Jenkins Web UI within the Katacoda interactive learning environment.

[https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com)

You'll be presented with a web page that has a button labeled, `Display Port`. Click that button which will then shows you Jenkins Getting Start page, as shown below.

![Display Port](https://github.com/reselbob/mabljenkins/blob/master/assets/access-ui-katacoda.jpg?raw=true)

Next you'll be shown a web page that wants you to enter the Login ID your identified in Step 6, as shown in the figure below. Do so.

![Enter Login ID](https://github.com/reselbob/mabljenkins/blob/master/assets/unlock-jenkins.jpg?raw=true)

Then complete the Jenkins initialization process until you arrive at the Jenkins Server Home Page, as shown in the figure below.

![Jenkins Web UI](https://github.com/reselbob/mabljenkins/blob/master/assets/jenkins-home-page.jpg?raw=true)

This completes the process of setting up the `mablJenkins` server. The steps that follow will have you working within the `mabl` web site to create UI tests. Also, you'll work within this `mablJenkins` server to setup the [Jenkins Pipeline](https://jenkins.io/doc/book/pipeline/getting-started/) job that will run the tests you create in `mabl`.
