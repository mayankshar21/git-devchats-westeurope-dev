$resource_group = "rg-newmayank-westeurope-dev"
$location = "westeurope"
$subscription_id = "56a4394e-6c1e-4255-958f-17a40db529a5"

Set-AzContext -SubscriptionId $subscription_id
New-AzResourceGroup -Name $resource_group -Location $location

$output = New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\vnet\template.json -TemplateParameterFile .\vnet\parameters.json -AsJob
Wait-Job $output
New-AzResourceGroupDeployment -ResourceGroupName $resource_group -TemplateFile .\networkInterface\network_template.json -TemplateParameterFile .\networkInterface\network_parameters.json