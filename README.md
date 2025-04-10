# Tasks completed so far
- Create resource group
- Create Vet and NSG

# Problems faced so far
New-AzResourceGroupDeployment: D:\data_files\code\git-devchats-westeurope-dev\deploy.ps1:22:1
Line |
  22 |  New-AzResourceGroupDeployment -ResourceGroupName $resource_group -Tem …
     |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     | 11:58:52 - The deployment 'template' failed with error(s). Showing 1 out of 1 error(s). Status Message: Parameter 'osDisk.managedDisk.id' is not allowed. 
     | (Code:InvalidParameter)  CorrelationId: bd9e0585-cda4-40cb-a8d4-2aaa93fa0421