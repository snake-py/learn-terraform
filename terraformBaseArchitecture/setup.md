# Set up a managed remote backend

It is a little tricky to set up a remote backend in Terraform, because we ant that all resources are managed by terraform. But to save the state on a remote backend we already need a S3 bucket and a dynamo table. In order to have these two resources managed by terraform we need first to create both resources locally and then to create the remote backend.

1. run the normal cycle of terraform init, plan, apply with main_step1.tf file.
2. run the normal cycle of terraform init with main_step2.tf file. It will ask if you want to import your current state into the remote backend. (yes)
