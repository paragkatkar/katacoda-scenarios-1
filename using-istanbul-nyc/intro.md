 * **Educational Objective**
 * **What You Need To Know Before You Start**
 * **Understanding Node.js Code Coverage using Istanbul/Nyc**
 * **Scenario Contents**
 * **Getting the Source Code from GitHub**
 
------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------
 
## Educational Objective
The objective of this scenario is to demonstrate how to apply Mocha unit testing and [Istanbul/Nyc](https://www.npmjs.com/package/nyc)
code coverage to an application running under [Node.js](https://nodejs.org/en/).


## What You Need To Know Before You Start
In order to get full benefit from the concepts and tasks presented in this scenario you need to have basic understanding
of how to enter commands in the Katacoda interactive learning environment. Each step has commands that can be entered
into the interactive terminal automatically by clicking on the command in the left side text pane of the interactive environment's web page.

There is no need to type directly into the terminal window. Clicking on a command will automatically execute it.

Also, it's useful to understand the basics of programming Node.js using Javascript as well as the basic of running
unit tests in the [Mocha](https://mochajs.org/) test framework.




## Understanding Node.js Code Coverage using Istanbul/Nyc

Code coverage is the process of measuring how many lines of code get exercised by a project's unit tests. The Node.js package
used to execute unit tests on the code base for the demonstration application is [Mocha](https://mochajs.org/). The 
page used to generate coverage reports based the Mocha's test results
is [Istanbul/Nyc](https://www.npmjs.com/package/nyc).

You'll run the tests in Step 4 of this scenario.

After you run the unit test and coverage tests you'll out put that looks something similar to this:

```text
6 passing (113ms)

-----------|----------|----------|----------|----------|-------------------|
File       |  % Stmts | % Branch |  % Funcs |  % Lines | Uncovered Line #s |
-----------|----------|----------|----------|----------|-------------------|
All files  |    90.91 |    81.25 |      100 |    92.86 |                   |
 server.js |    90.91 |    81.25 |      100 |    92.86 |          15,16,29 |
-----------|----------|----------|----------|----------|-------------------|
```

You'll view the details of this report when you do the step.

## Scenario Contents

Here's a listing of the steps you'll take in the scenario.

**Step 1** - Installing the Node.js Application

**Step 2** - Reviewing the Code

**Step 3** - Reviewing the Tests

**Step 4** - Running the Tests with Coverage and Reviewing the Results

**Step 5** - Using the Pinger API

To proceed, click the `Continue` button.

----

## Getting the Source Code from GitHub
You can view the source code for the pinger demonstration application  and test regimine can be found on
GitHub, [here](https://github.com/reselbob/pinger).