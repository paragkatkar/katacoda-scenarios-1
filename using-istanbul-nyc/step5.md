Now that we've run our tests, let's use the `pinger` API.

Let's start up the `pinger` API so see the information it provides.

**Task 1:** Execute the following command to start the `pinger` API server in the second terminal window.

`cd pinger/app/ && node server.js`{{execute T2}}

**Task 2:** To see all the `pinger` information in a web browser, go here:

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/

**Task 3:** To see network information about the server on which `pinger` is running in a web browser, go here:

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/?type=networkInfo

**Task 4:** To see request header information that's part of a request against `pinger` in a web browser, go here:

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/?type=requestHeaders

**Task 5:** To see environment variable information the server process on which `pinger` is running in a web browser, go here:

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/?type=envVars

**Task 6:** To see current time on the server process on which `pinger` is running in a web browser, go here:

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/?type=currentTime

**Task 7:** To the request URL sent to `pinger` in a web browser, go here:

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/?type=requestUrl

**Congratulations! You're done!**