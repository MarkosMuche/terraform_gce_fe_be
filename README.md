

first create .env file and put the project id in it. 

GCP_PROJECT_ID=<your project id>


bash ```
gsutil cp ~/monolith-to-microservices/startup-script.sh gs://fancy-store-$DEVSHELL_PROJECT_ID

