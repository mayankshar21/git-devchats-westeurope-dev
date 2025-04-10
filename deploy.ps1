$resource_group = "rg-learntwo-westeurope-dev"
$location = "westeurope"
$subscription_id = "56a4394e-6c1e-4255-958f-17a40db529a5"

Set-AzContext -SubscriptionId $subscription_id
# New-AzResourceGroup -Name $resource_group -Location $location

# deploy vnet
# $output = New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\vnet\template.json -TemplateParameterFile .\vnet\parameters.json -AsJob
# Wait-Job $output

# deploy nsg one and network interface one
# New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\nsg\template.json -TemplateParameterFile .\nsg\parameters-1.json
# New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\networkInterface\template.json -TemplateParameterFile .\networkInterface\parameters-1.json

# deploy nsg two and network interface two
# New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\nsg\template.json -TemplateParameterFile .\nsg\parameters-2.json
# New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\networkInterface\template.json -TemplateParameterFile .\networkInterface\parameters-2.json

# deploy vms
New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\disk\template.json -TemplateParameterFile .\disk\parameters-1.json
New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\vm\template.json -TemplateParameterFile .\vm\parameters-1.json
# New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\vm\template.json -TemplateParameterFile .\vm\parameters-2.json