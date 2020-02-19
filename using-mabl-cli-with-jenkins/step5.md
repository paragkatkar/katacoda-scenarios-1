`Under Construction`



# Creating the Job

`TO BE PROVIDED`


# Encrypting mabl Access Data in Jenkins Secrets

**Step 1:** Accessing the credentials page.

Go to the Jenkins main page by clicking the Jenkins logo in the upper right corner as shown in the figure below.

![creating Jenkins Secret 1](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-01.png?raw=true)


Click the `Credentials` link from the items listed on the left side of the page.

![creating Jenkins Secret 2](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-02.png?raw=true)

 The page will show the **Stores scoped to Jenkins** section will appear on the right side.


![creating Jenkins Secret 3](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-03.png?raw=true)

**Step 2:** Creating global credentials

Click on the link, `Global credential (unrestricted)` as shown on the right side of the figure below.

![creating Jenkins Secret 4](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-04.png?raw=true)

**Step 3:** Click the link, `Add Credentials` that appears on the left side of the page.

![creating Jenkins Secret 5](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-05.png?raw=true)

**Step 4:** Select `Secret text`

Once you select `Add Credential` you'll be presented with a page that contains dropdown lists and textboxes. In the top most list labeled, **Kind:** select `Secret text` as shown in the figure below.

![creating Jenkins Secret 6](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-06.png?raw=true)

**Step 5:** Add the `mabl_access_token` secret

Click the link, **Add Credentials** on the left side of the Jenkins page.

Select `Global (Jenkins, nodes, items. all child items, etc)` from the dropdown (1).

Enter the value for the **mabl access token** that you've retreived from your account on the mabl web site in the textbox labeled, `Secret`. (2)

Enter a unique id for this secret in the textbox labeled,`ID` (3). In this case you'll see in the figure below that the string assigned to the ID is `mabl_access_token`.

Once all the data is entered, click the `OK` button beneath the data entry fields (4).

![creating Jenkins Secret 7](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-07.png?raw=true)

**Step 6:** Add the `mabl_environment_ID` secret

Click the link, **Add Credentials** on the left side of the Jenkins page.

![creating Jenkins Secret 8](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-08.png?raw=true)

Select `Global (Jenkins, nodes, items. all child items, etc)` from the dropdown (1).

![creating Jenkins Secret 9](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-09.png?raw=true)

Enter the value for the mabl **environment id** that you've retreived from your account on the mabl web site in the textbox labeled, `Secret`. (2)

Enter a unique id for this secret in the textbox labeled,`ID` (3). In this case you'll see in the figure below that the string assigned to the ID is `mabl_evironment_id`.

Once all the data is entered, click the `OK` button beneath the data entry fields (4).

![creating Jenkins Secret 10](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-10.png?raw=true)

Congratulations! You've created the two secrets you'll need to configure a Jenkins Pipeline job that uses the mabl CLI tool.

![creating Jenkins Secret 11](https://github.com/reselbob/mabljenkins/blob/master/assets/step05/create-secret-11.png?raw=true)

# Adding the Pipeline Script

`TO BE PROVIDED`

