![Video Under Construction](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/video-under-construction.jpg)
 
 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

CONTENT TO BE PROVIDED

`
mutation{
  ping(messageBody: "This is a simple message body.") @isAdmin{
    createdAt
    body
    name
    id
  }
}
`{{copy}}

You will get a response that looks similar to this:

```JSON
{
  "data": {
    "ping": {
      "createdAt": "Mon May 13 2019 05:30:21 GMT+0000 (Coordinated Universal Time)",
      "body": "{\"data\":\"This is a simple message body.\",\"adminData\":{\"processId\":1,\"memoryUsage\":{\"rss\":52592640,\"heapTotal\":22872064,\"heapUsed\":18320136,\"external\":38364},\"networkInfo\":{\"lo\":[{\"address\":\"127.0.0.1\",\"netmask\":\"255.0.0.0\",\"family\":\"IPv4\",\"mac\":\"00:00:00:00:00:00\",\"internal\":true,\"cidr\":\"127.0.0.1/8\"}],\"eth0\":[{\"address\":\"172.18.0.2\",\"netmask\":\"255.255.255.0\",\"family\":\"IPv4\",\"mac\":\"02:42:ac:12:00:02\",\"internal\":false,\"cidr\":\"172.18.0.2/24\"}]},\"currentTime\":\"2019-05-13T05:30:21.745Z\"}}",
      "name": "PING",
      "id": "c9e4883e-35ac-4f2b-8e02-fcc6f141ff53"
    }
  }
}

```