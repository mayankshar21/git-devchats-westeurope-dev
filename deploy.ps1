$LOCATION = "westeurope"
$DOMAIN = "devchats"
$ENVIRONMENT = "dev"
$RESOURCE_GROUP = "rg-$DOMAIN-$LOCATION-$ENVIRONMENT"
$SUBSCRIPTION_ID = "56a4394e-6c1e-4255-958f-17a40db529a5"

Set-AzContext -SubscriptionId $SUBSCRIPTION_ID
New-AzResourceGroup -Name $RESOURCE_GROUP -Location $LOCATION

# deploy vnet
New-AzResourceGroupDeployment -ResourceGroupName $RESOURCE_GROUP -TemplateFile .\vnet\template.json -TemplateParameterFile .\vnet\parameters.json

# deploy nsg one and network interface one
New-AzResourceGroupDeployment -ResourceGroupName $RESOURCE_GROUP -TemplateFile .\nsg\template-one.json -TemplateParameterFile .\nsg\parameters-one.json
New-AzResourceGroupDeployment -ResourceGroupName $RESOURCE_GROUP -TemplateFile .\nic\template-one.json -TemplateParameterFile .\nic\parameters-one.json

# deploy nsg two and network interface two
New-AzResourceGroupDeployment -ResourceGroupName $RESOURCE_GROUP -TemplateFile .\nsg\template-two.json -TemplateParameterFile .\nsg\parameters-two.json
New-AzResourceGroupDeployment -ResourceGroupName $RESOURCE_GROUP -TemplateFile .\nic\template-two.json -TemplateParameterFile .\nic\parameters-two.json

# deploy pip
New-AzResourceGroupDeployment -ResourceGroupName $RESOURCE_GROUP -TemplateFile .\pip\template.json -TemplateParameterFile .\pip\parameters.json

# deploy lbe

# deploy vml
# New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\disk\template.json -TemplateParameterFile .\disk\parameters-1.json
# New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\vm\template.json -TemplateParameterFile .\vm\parameters-1.json
# New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\vm\template.json -TemplateParameterFile .\vm\parameters-2.json