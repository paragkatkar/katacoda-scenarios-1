TO BE PROVIDED

Let's check to see that the GraphQL API is up and running

`curl 'http://localhost:4000/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'Connection: keep-alive' -H 'DNT: 1' -H 'Origin: http://localhost:4000' -H 'authorization: ch3ddarch33s3' --data-binary '{"query":"mutation{\n  ping(payload: \"This is a test payload\") {\n    createdAt\n    payload\n    name\n    id\n  }\n}"}' --compressed`{{execite}}