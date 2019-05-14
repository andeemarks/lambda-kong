variable "aws_access_key_id" {}

variable "aws_secret_access_key" {}

provider "kong" {
  kong_admin_uri = "http://localhost:8001"
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "kong_service" "service" {
  name     = "test"
  protocol = "http"
  host     = "mockbin.org"
  port     = "80"
}

resource "kong_route" "route" {
  protocols  = ["http", "https"]
  hosts      = ["example.com"]
  service_id = "${kong_service.service.id}"
}

resource "kong_plugin" "aws_lambda" {
  name     = "aws-lambda"
  route_id = "${kong_route.route.id}"

  config_json = <<EOT
	{
		"aws_region": "ap-southeast-2",
		"function_name" : "hello",
    "aws_key": "${var.aws_access_key_id}",
    "aws_secret": "${var.aws_secret_access_key}",
    "is_proxy_integration": true
	}
EOT
}
