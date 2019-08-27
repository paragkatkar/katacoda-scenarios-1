# Running the Pinger Tests and Analyzing Results

UNDER CONSTRUCTION

`cd /root/pinger/app/`{{execute}}

`cat package.json`{{execute}}

```json

 "scripts": {
    "test": "nyc mocha",
    "start": "node server.js"
  }
```

`npm test`{{execute}}

```text
6 passing (113ms)

-----------|----------|----------|----------|----------|-------------------|
File       |  % Stmts | % Branch |  % Funcs |  % Lines | Uncovered Line #s |
-----------|----------|----------|----------|----------|-------------------|
All files  |    90.91 |    81.25 |      100 |    92.86 |                   |
 server.js |    90.91 |    81.25 |      100 |    92.86 |          15,16,29 |
-----------|----------|----------|----------|----------|-------------------|
```

`cd /root/pinger/app/coverage`{{execute}}

`ls -l`{{execute}}
