**Objective:** The objective of this step is to install a special version of Jenkins that is configured with the [mbl CLI](https://help.mabl.com/docs/mabl-cli) tool. The Jenkins server is named, `mablJenkins` and runs as a container under Docker.

**Step 1:** Clone the `mablrepository code

`git clone https://github.com/reselbob/mabljenkins.git`{{execute}}

**Step 2:** Go to the project's directory

`cd mabljenkins`{{execute}}

**Step 3:** Build the container image locally.

`docker build -t mabljenkins:v1 .`{{execute}}

**Step 4:** Create the container based on the local Docker image, making the host's version of Docker available to the Jenkins container

`docker run --name jenkins -d -p 80:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker mabljenkins:v1`{{execute}}

**Step 5:** Get the initial login ID that you'll need to access Jenkins

`docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword`{{execute}}

You'll output that is similar to, but not exactly like the following:

`4b36a89b91a24c51a5d4042433c013e2`

**Step 6:** Confirm the `docker` command works from inside the Jenkins container

`docker exec -it jenkins docker ps`{{execute}}

You'll output that is similar to, but not exactly like the following:

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                       NAMES
177b9fe064b7        mabljenkins:v1      "/sbin/tini -- /usr/…"   24 seconds ago      Up 24 seconds       0.0.0.0:50000->50000/tcp,0.0.0.0:80->8080/tcp   jenkins
```

**Step 7:** Bring up the mablJenkins server Web UI

Click the link below to be bring up the mablJenkins server Web UI in a new brower tab.

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com