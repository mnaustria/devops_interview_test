# DevOps Interview Task

## Part 1: Automated Deployment

### Prerequisites
- Docker
- PowerShell
- .NET Core SDK

### Running the Deployment

1. **Clone the Repository:**
   ```bash
   git clone git@github.com:mnaustria/devops_interview_test.git
   cd devops_interview_test


2. **Run the Deployment Script:**
   ```bash
   ./Deploy.ps1
    ```
    This script will: \
    • Run the automated tests. \
	• Package the application as a Docker image.\
	• Deploy and run the image locally.

## Part 2: Infrastructure Documentation

### AWS Infrastructure

1. **Amazon Elastic Kubernetes Service (EKS):**
   - Deploy a Kubernetes cluster using Amazon EKS. EKS provides a managed Kubernetes environment, simplifying cluster setup and management.

2. **Public Access to Web Services:**
   - Use an AWS Load Balancer (ALB or NLB) to expose the web services to the internet. The Load Balancer will handle incoming traffic and distribute it across the Kubernetes nodes.

3. **Monitoring and Alerts:**
   - Use Amazon CloudWatch to set up monitoring and alerts. CloudWatch can notify the support team via email, SMS, or integration with AWS Systems Manager for incident management.

4. **Automated Deployments:**
   - Implement a CI/CD pipeline using AWS CodePipeline. This pipeline will automate the deployment process, ensuring that code changes are automatically tested, built, and deployed to the EKS cluster.

5. **Secure Access to Internal Systems:**
   - Create an Amazon Virtual Private Cloud (VPC) named “internal-assets” to host the pre-existing internal systems.
   - Set up a VPC peering connection or VPN gateway to securely connect the EKS cluster to the “internal-assets” VPC. This ensures secure communication between the Kubernetes cluster and the internal systems.
   - Use Kubernetes Network Policies to restrict traffic within the cluster and ensure that only authorized services can communicate with the internal systems.

### Infrastructure Diagram

```plaintext
                           +----------------------+
                           |   Public Internet    |
                           +----------+-----------+
                                      |
                           +----------v-----------+
                           |  AWS Load Balancer   |
                           +----------+-----------+
                                      |
                           +----------v-----------+
                           |  Amazon EKS Cluster  |
                           +----------+-----------+
                                      |
                           +----------v-----------+
                           |     Web Service      |
                           |        Pods          |
                           +----------+-----------+
                                      |
                +---------------------v------------------------+
                |             VPC (internal-assets)            |
                | +------------------+   +------------------+  |
                | | Internal System 1|   | Internal System 2|  |  
                | +------------------+   +------------------+  |
                +----------------------------------------------+
```
### Key Points

- **Public Access:** Use an AWS Load Balancer to expose the web services to the internet.
- **Monitoring and Alerts:** Use Amazon CloudWatch for monitoring and alerting.
- **Automated Deployments:** Set up a CI/CD pipeline using AWS CodePipeline.
- **Secure Access:** Secure communication between the Kubernetes cluster and internal systems is achieved using VPC peering, VPN gateways, and network policies.

### Accessing Internal Systems

- **VPC Peering/VPN Gateway:** Use a VPC peering connection or VPN gateway to securely connect the EKS cluster to the “internal-assets” VPC.
- **Network Policies:** Use Kubernetes Network Policies to restrict and secure traffic within the EKS cluster.