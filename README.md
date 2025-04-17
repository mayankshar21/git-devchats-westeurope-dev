# Latest Changes
- Added deployment steps for disks and VMs in the `deploy.ps1` script.
  - Disk deployment uses `disk/template.json` and `disk/parameters-1.json`.
  - VM deployment uses `vm/template.json` and `vm/parameters-1.json`.

# Tasks completed so far
- Create resource group
- Create VNet and NSG
- Deploy disks and VMs

# Problems faced so far
New-AzResourceGroupDeployment: D:\data_files\code\git-devchats-westeurope-dev\deploy.ps1:22:1
Line |
  22 |  New-AzResourceGroupDeployment -ResourceGroupName $resource_group -Tem …
     |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     | 11:58:52 - The deployment 'template' failed with error(s). Showing 1 out of 1 error(s). Status Message: Parameter 'osDisk.managedDisk.id' is not allowed. 
     | (Code:InvalidParameter)  CorrelationId: bd9e0585-cda4-40cb-a8d4-2aaa93fa0421

# Solution
The disk createOption should be "Attach" rather than "FromImage". Also the "ImageReference" should be removed. Also remove OSProfile since the createOption is "Attach".
"storageProfile": {
                    "osDisk": {
                        "osType": "Linux",
                        "name": "[concat(parameters('virtualMachines_vml_learnthree_westeurope_dev_name'), '_OsDisk_1_4887e18e5ba2448184eeef1a26fffe3c')]",
                        "createOption": "Attach",
                        "caching": "ReadWrite",
                        "managedDisk": {
                            "id": "[parameters('disks_vml_learnthree_westeurope_dev_OsDisk_1_4887e18e5ba2448184eeef1a26fffe3c_externalid')]"
                        },
                        "deleteOption": "Delete"
                    },
                    "dataDisks": [],
                    "diskControllerType": "SCSI"
                },