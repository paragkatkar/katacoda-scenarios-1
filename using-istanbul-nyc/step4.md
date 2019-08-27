# Running the Pinger Tests and Analyzing Results

UNDER CONSTRUCTION

Go back to the application source code directory.

`cd /root/pinger/app/`{{execute}}

Take a look at `package.json`.

`cat package.json`{{execute}}

Notice in the `scripts` section there is a `test` command as
well as an entry for a `coverage` command.

```json

 "scripts": {
    "test": "nyc mocha",
    "start": "node server.js",
    "coverage": "nyc --reporter=lcov --reporter=text-lcov npm test"
  }
```

Run the unit tests.

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

Run the run the tests again only this time generate a coverage report in HTML.

`npm run coverage`{{execute}}

Go the the `coverage` directory that gets created when tests are run with coverage.

`cd /root/pinger/app/coverage`{{execute}}

Take a look at the files and directories generated.

`ls -l`{{execute}}

Notice there is a directory, `lcov-report`. Navigate tothe directory/

`cd /root/pinger/app/coverage/lcov-report`{{execute}}

This directory contains the HTML files that describe various aspects of coverage. Take a look at the
files.

`ls -l`{{execute}}

`index.html` is the home file. Take a look at the files's contents.

`cat index.html`{{execute}}

It's the home page for the coverage report. If were to open it in browser you'd get output
that looks like the following.

![Coverage](https://raw.githubusercontent.com/reselbob/katacoda-scenarios/master/using-istanbul-nyc/images/coverage.png)


