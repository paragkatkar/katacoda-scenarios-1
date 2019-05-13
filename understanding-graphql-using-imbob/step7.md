![Video Under Construction](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/understanding-graphql-using-imbob/images/video-under-construction.jpg)
 
 <img src="http://www.gosc.org/_Media/under-construction-yellow-d_med.png" width="60" alt="under construction" />

------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

CONTENT TO BE PROVIDED


First, let's try using the directive `@isAdmin` with the `curl` command.

Execute the following

`curl 'http://localhost:80/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'Connection: keep-alive' -H 'DNT: 1' -H 'Origin: http://localhost:80' -H 'authorization: ch3ddarch33s3' --data-binary '{"query":"mutation{\n  ping(messageBody: \"This is a simple message body.\") @isAdmin {\n    createdAt\n    body\n    name\n    id\n  }\n}"}' --compressed`{{execute}}

Then we can try it in the GraphQL Playground UI.

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

```
{"data":{
    "ping":{"createdAt":"Mon May 13 2019 06:30:49 GMT+0000 (Coordinated Universal Time)",
    "body":{"data":"This is a simple message body.",
            "adminData":{
              "processId":1,
              "memoryUsage":{
                "rss":62636032,
                "heapTotal":38076416,
                "heapUsed":19071416,
                "external":140584},
              "networkInfo":{
                "lo":[
                  {"address":"127.0.0.1",
                   "netmask":"255.0.0.0",
                   "family":"IPv4",
                   "mac":"00:00:00:00:00:00",
                   "internal":true,
                   "cidr":"127.0.0.1/8"}],
                   "eth0":[
                     {"address":"172.18.0.2",
                      "netmask":"255.255.255.0",
                      "family":"IPv4",
                      "mac":"02:42:ac:12:00:02",
                      "internal":false,
                      "cidr":"172.18.0.2/24"}
                      ]}
                "currentTime":"2019-05-13T06:30:49.563Z"}},
              "name":"PING",
              "id":"80b38554-73fa-4472-90da-74ed69929a5f"
              }
        }
}
             
```