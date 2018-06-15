# terraform-docker

terraform-docker: Sandbox with Amazon Linux and Terraform. AWS APIS are mocked with Localstack.

## How to Install?
```bash
git clone https://github.com/diegopacheco/terraform-docker.git
cd terraform-docker/
./terraform-docker.sh bake
```

## How to Run?
Terminal 1
```bash
./terraform-docker.sh localstack
```
Terminal 2
```bash
./terraform-docker.sh run
```
```bash
./terraform-docker.sh run

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 1.23"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
aws_s3_bucket.b: Creating...
  acceleration_status:         "" => "<computed>"
  acl:                         "" => "public-read"
  arn:                         "" => "<computed>"
  bucket:                      "" => "my-tf-test-bucket"
  bucket_domain_name:          "" => "<computed>"
  bucket_regional_domain_name: "" => "<computed>"
  force_destroy:               "" => "false"
  hosted_zone_id:              "" => "<computed>"
  region:                      "" => "<computed>"
  request_payer:               "" => "<computed>"
  versioning.#:                "" => "<computed>"
  website_domain:              "" => "<computed>"
  website_endpoint:            "" => "<computed>"
aws_s3_bucket.b: Creation complete after 0s (ID: my-tf-test-bucket)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

address = my-tf-test-bucket
```

## How do make changes in terraform ?

Jutst goto src/main.tf and do you code there. There are specific configs there in order to mock aws with localstack.

## How to Check "Objects" created on "AWS"?

Just goto: http://localhost:8080/#/infra
