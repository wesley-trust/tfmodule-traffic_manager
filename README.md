# tfmodule-traffic_manager
Terraform module for deploying Traffic Manager to Azure, with Terratest Unit/Integration testing via Go, and Regula (OPA) Policy as Code scanning in an Azure DevOps Pipeline
## [CI/CD Pipeline](https://dev.azure.com/wesleytrust/Terraform/_build?definitionId=72)
Select a stage to view in Azure DevOps. *Note that 'Skipped' stages in the last run, will show as "unknown" by design.*
| Pipeline |
| :------: |
|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/Modules/Deployments/tfmodule-traffic_manager?repoName=wesley-trust%2Ftfmodule-traffic_manager&branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=72&repoName=wesley-trust%2Ftfmodule-traffic_manager&branchName=main)|
### Testing Stages
| Unit Tests | Integration Tests |
|  :-------: | :---------------: |
|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/Modules/Deployments/tfmodule-traffic_manager?repoName=wesley-trust%2Ftfmodule-traffic_manager&branchName=main&stageName=Unit)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=72&repoName=wesley-trust%2Ftfmodule-traffic_manager&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/Modules/Deployments/tfmodule-traffic_manager?repoName=wesley-trust%2Ftfmodule-traffic_manager&branchName=main&stageName=Integration)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=72&repoName=wesley-trust%2Ftfmodule-traffic_manager&branchName=main)|