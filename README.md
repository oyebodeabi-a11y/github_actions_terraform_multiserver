# github_actions_terraform_multiserver
Automating the deployment of Nginx, Jenkins and Apache 2 across multiple servers using GitHub Actions empowers development teams to streamline their deployment processes, reduce manual effort, and maintain consistency across environments.


Project: Using Github actions as a CICD tool to provision multi EC2 instances to launch Nginz, Apache 2 and Jenkins servers using terraform.

1. Create your project in github. clone and paste in the root directory in vs code.

2. Create a folder called  .github

3. cd .github and create a folder called workflows

4. cd to workflows

5. Create a file called githubactionsinfra.yml. The .yml include the terraform codes for run to provision the EC2 instances to launch the Nginx, Apache 2 and Jenkins server. The apply action automatically provisions EC2 infrastructure or terraform destroy action to terminate the created infrastructure.

6. push the code to github.

7. In github, click on "action"

8. In Infrastructure Provisioning with Githubactions Pipeline, click on Run workflow dropdown and select Apply.

9. Include the AWS region,  secret key and access secret key by clicking on settings, secret&variables, actions, new repository secret and save. 

10. Click on actions on git hub and the code should complete.

11. Check to see that 3 different http links are generated. Click on each link. 

12. Go to Amazon console and click on the EC2 instances - Nginx, Apache 2 and Jenkins servers. 

13. Next, in Infrastructure Provisioning with Githubactions Pipeline, click on Run workflow dropdown and select Destroy.

14. The terrafrom code to destroy the provisioned EC2 instances with the 3 servers are destroyed successfully.


<img width="482" height="242" alt="Image" src="https://github.com/user-attachments/assets/fe9cafe3-e714-451a-929a-ed2ee964c61c" />

<img width="602" height="434" alt="Image" src="https://github.com/user-attachments/assets/e6342cab-a413-4a0a-a1cf-3fce14e3113f" />

<img width="739" height="404" alt="Image" src="https://github.com/user-attachments/assets/0e5527ea-958b-4103-8095-1be51b16c0f0" />


<img width="667" height="380" alt="Image" src="https://github.com/user-attachments/assets/821dfce7-3405-407b-949a-52278083bbf6" />



