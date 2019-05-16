# Prerequisites

* [Terraform](https://www.terraform.io/downloads.html) (tested on v0.11.13)
* The [AWS command line tools](https://aws.amazon.com/cli/) (tested on 2.454.0)
* An [AWS access key pair](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) for your AWS account

# Installation

1. Clone this repository

1. Change into the directory containing this cloned repository

1. ```terraform init```

1. ```terraform apply``` (with ```aws_access_key_id``` and ```aws_secret_access_key``` as provided as environment variables or interactively)

