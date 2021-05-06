Once you have the terraform-controller running with CRDS applied, applying the yaml files under the current directory will produce following:

```
kubectl get executions.terraformcontroller.cattle.io -A
NAMESPACE              NAME             AGE
terraform-controller   my-state-fj55v   23m

kubectl get states.terraformcontroller.cattle.io -A
NAMESPACE              NAME       AGE
terraform-controller   my-state   29m

kubectl get modules.terraformcontroller.cattle.io -A
NAMESPACE              NAME        AGE
terraform-controller   my-module   29m
```


The execution CRD will trigger a job and does contain the executor image passing environment variables, secrets as needed. In this case, the job triggers a pod and fails with following in logs:

```
kubectl logs -f job-my-state-fj55v-7hddp
time="2021-05-06T13:11:22Z" level=info msg="before clone"
time="2021-05-06T13:11:22Z" level=info msg="Output from git clone []"
time="2021-05-06T13:11:22Z" level=info msg="Output from git checkout []"
time="2021-05-06T13:11:22Z" level=info msg="before config"
Initializing modules...
Downloading terraform-aws-modules/security-group/aws 4.0.0 for security_group...
- security_group in .terraform/modules/security_group

Initializing the backend...

Successfully configured the backend "kubernetes"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Finding hashicorp/aws versions matching ">= 2.65.*, >= 2.42.*"...
- Installing hashicorp/aws v3.38.0...
- Installed hashicorp/aws v3.38.0 (self-signed, key ID 34365D9472D7468F)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/plugins/signing.html

Terraform has been successfully initialized!
Initializing modules...
Downloading terraform-aws-modules/security-group/aws 4.0.0 for security_group...
- security_group in .terraform/modules/security_group

Initializing the backend...

Successfully configured the backend "kubernetes"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Finding hashicorp/aws versions matching ">= 2.65.*, >= 2.42.*"...
- Installing hashicorp/aws v3.38.0...
- Installed hashicorp/aws v3.38.0 (self-signed, key ID 34365D9472D7468F)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/plugins/signing.html

Terraform has been successfully initialized!
2021/05/06 13:11:28
Error: error configuring Terraform AWS Provider: no valid credential sources for Terraform AWS Provider found.

Please see https://registry.terraform.io/providers/hashicorp/aws
for more information about providing credentials.

Error: NoCredentialProviders: no valid providers in chain. Deprecated.
	For verbose messaging see aws.Config.CredentialsChainVerboseErrors


  on main.tf line 1, in provider "aws":
   1: provider "aws" {


: exit status 1
```
