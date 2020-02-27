In this step you're going to create a `mabl` application and bind it to an external website.

In terms of `mabl` an application is an organizational unit that describes an external website or web application you want to test. You'll reference the application you describe in `mabl` when creating tests.

To create an application under `mabl` take the following steps.

**Step 1:** Click the tab, `mabl App Site` at the top of the Katacoda interactive learning environment as shown in the figure below. 

![mabl Tab](/reselbob/scenarios/using-mabl-creating-a-test/assets/mabl-tab.png)

**Step 2:** Go to the Configuration page in `mabl` website.

To get to the Configuration page, click the Configure link on the left side of the `mabl` Dashboard, as shown in the figure below.

![Select Configure](/reselbob/scenarios/using-mabl-creating-a-test/assets/select-configure.png)

**Step 3:** Click the Application link

Click the Application link on the horizontal menu of the Configuration page as shown in the figure below.

![Configure App 1](/reselbob/scenarios/using-mabl-creating-a-test/assets/app-config-01.png)

**Step 4:** Enter Application name, description, base URL and environment

After you click the Application link, you'll be taken to the New application web page into which you'll enter the data necessary to define the `mabl` application.

* **Enter a name for you application** in the textbox labeled, `Application name`. (1). In this case you'll call the application, `Cool Cheese App`.
* **Enter a description of the application** in the textbox labeled, `Description` (2). You can enter a description such as, `A mabl application for the Cool Cheese website`.
* **Enter the URL for the website** that you're binding to the `mabl` application. Choose, `http://` or `https://` from the dropdown labeled, `Protocol`. (3) Then, enter the `Base URL`. (4) In this case, the base URL for the Cool Cheese website is `34.94.59.13:8080/index.html`.
* **Declare the Environment.** `mabl` allows you to organize tests according to environment. Environment names are custom. For example you can create environment names, `DEV`, ``QA`, `STAGING`, and `PROD`, or you can create names that are suitable for you needs. When it comes to declaring a environment within the new Application page, you select an prexisting environment (should you have made one previously) or you can enter a new environment name in the textbox labled, `Environment name`. When you enter a new environment name, `mabl` will present an option beneath the textbox to add the new environment. Click that option to add the new environment. Otherwise, select a prexisting environment for the Environment name. (5)
* **Unselect Automatically login** when encountering a login page. The Cool Cheese website has no login page, so you will not need to enter access credentials. (6)
* **Click the button** labeled, `Save`. (7).

![Configure App 2](/reselbob/scenarios/using-mabl-creating-a-test/assets/app-config-02b.png)

**Step 5:** Review the Application configuration information

Upon clicking the `Save` button in the previous step, the application information will be saved and displayed under the Application section of the Configuration page, as shown in the figure below.

![Configure App 3](/reselbob/scenarios/using-mabl-creating-a-test/assets/app-config-03.png)