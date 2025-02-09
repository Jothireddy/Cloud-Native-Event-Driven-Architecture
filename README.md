# Cloud-Native Event-Driven Architecture

This project demonstrates a cloud‑native event‑driven architecture on AWS using SNS, SQS, and Kinesis. The solution includes:

- **AWS SNS:** A topic to which applications publish events.
- **AWS SQS:** A queue subscribed to the SNS topic to decouple and reliably store messages.
- **AWS Kinesis:** A stream to ingest events for real‑time processing.
- **(Optional) AWS Lambda:** A sample Lambda function triggered by Kinesis to process events in real time.

All resources are provisioned via Terraform for a reproducible, version‑controlled deployment. Use this architecture to build real‑time, scalable event processing systems in the cloud.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup & Deployment](#setup--deployment)
- [How It Works](#how-it-works)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project creates an event‑driven system where:
- Producers publish events to an SNS topic.
- The SNS topic fans out messages to one or more SQS queues.
- In parallel, events are sent to a Kinesis stream for real‑time processing.
- Optionally, a Lambda function is subscribed to the Kinesis stream and processes incoming events.

## Architecture

1. **SNS Topic:** Serves as the central hub for event notifications.
2. **SQS Queue:** Receives messages from SNS to enable asynchronous processing and decoupling.
3. **Kinesis Stream:** Captures event data for real‑time analytics and processing.
4. **Lambda Function (Optional):** Processes records from the Kinesis stream (e.g., for filtering, transformation, or further downstream processing).

## Project Structure

cloud-native-event-driven/ ├── README.md ├── terraform/ │ ├── provider.tf # AWS provider configuration │ ├── variables.tf # Input variables │ ├── sns.tf # SNS topic definition │ ├── sqs.tf # SQS queue and SNS subscription │ ├── kinesis.tf # Kinesis stream definition │ ├── lambda.tf # Lambda function and event source mapping (optional) │ └── outputs.tf # Outputs for key resources ├── lambda/ │ └── event_processor.py # Sample Lambda function code ├── scripts/ │ └── deploy.sh # Deployment script for Terraform


## Prerequisites

- **AWS Account:** With permissions to create SNS, SQS, Kinesis, and Lambda resources.
- **Terraform (v1.0+):** [Download and Install Terraform](https://www.terraform.io/downloads.html)
- **AWS CLI:** Configured with your AWS credentials.
- **Python 3.8+** (if using the sample Lambda function)
- **Git:** For cloning and version controlling the repository.

## Setup & Deployment

1. **Clone the Repository:**

 ```bash
   git clone <repository_url>
 ```
Deploy the Infrastructure with Terraform:
```
cd terraform
terraform init
terraform plan -out=tfplan
terraform apply -auto-approve tfplan
```
This creates:
An SNS topic.
An SQS queue subscribed to the SNS topic.
A Kinesis stream.
(Optional) A Lambda function that processes events from the Kinesis stream.
(Optional) Package & Deploy Lambda Code:

If you modify the Lambda function in lambda/event_processor.py, package it into a ZIP file (named event_processor.zip) and update the Terraform configuration accordingly.

## How It Works
Event Publication: Applications publish events to the SNS topic.
Message Fan-out: SNS distributes messages to the SQS queue (and other subscribers, if configured).
Real-Time Processing: The same events are streamed to Kinesis for immediate processing by downstream consumers.
Lambda Processing: (Optional) The Lambda function, triggered by Kinesis events, processes incoming data in real time.
## Troubleshooting
Terraform Errors: Verify your AWS credentials and permissions. Check that resource names (e.g., SNS topic and SQS queue names) are unique.
Lambda Issues: Review CloudWatch logs for the Lambda function to troubleshoot any runtime errors.
Event Delivery: Ensure that the SQS queue policy allows SNS to deliver messages. (Terraform will automatically configure this if set up correctly.)
## Contributing
Contributions are welcome! Please fork the repository, create your feature branch, and open a pull request with your changes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

Happy building your event‑driven systems!
