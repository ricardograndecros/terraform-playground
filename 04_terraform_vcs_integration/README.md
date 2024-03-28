# Terraform with VCS workflow
Integration with TF Cloud usign Github App. 

When a new PR draft is openned, it runs a TF Plan. If successful, lets you merge. 

Only runs tf commands on this directory. 

Once it is merged, the TF run will show up at TF Cloud. A plan will be ran and then it will ask to confirm before applying the changes. It can be configured to apply changes automatically if the tf plan is successful. 

TF destroy cannot be ran from local terminal since the VCS integration is the source of truth. 
Elements can only be deleted if they are deleted in the code and then pushed to the repo. 