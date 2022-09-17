# echo-REST-microservice

#### How to containerize and run the microservice with Docker
```bash
docker build -t echo-rest-microservice .
docker run -p 8000:8000 -ti echo-rest-microservice
```

#### How I would deploy the microservice into a Kubernetes cluster
I would use Amazon EKS with Fargate. This means that EKS will deploy and manage the Kubernetes master nodes and Fargate will take care of the worker nodes. The reason why I would use Fargate instead of, for instance, EC2 instances is because Fargate does not need any provision or management and it is on demand and only uses the infrastructure resources needed by the container. I would also use an Amazon ECR where you can push the Docker image of the microservice and deploy them into the cluster by pulling them from the ECR. You can set it up so that when a new image is pushed to the ECR, it will be pulled to the EKS and deployed into the cluster.  