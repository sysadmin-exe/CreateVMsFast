# Variables for common values
$resourceGroup = "web_rg"
$location = "westeurope"
$vmName = "machine1"
$VNet = "web_server_vnet"

# Create user object
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

# Create a virtual network
$vnet = Get-AzVirtualNetwork -ResourceGroupName $resourceGroup -Name $VNet

# Create a virtual network card and associate with public IP address and NSG
$nic = New-AzNetworkInterface -Name machine1-nic -ResourceGroupName $resourceGroup -Location $location `
  -SubnetId $vnet.Subnets[0].Id 

# Create a virtual machine configuration
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize Standard_B1s | `
Set-AzVMOperatingSystem -Linux -ComputerName $vmName -Credential $cred | `
Set-AzVMSourceImage -PublisherName Canonical -Offer UbuntuServer -Skus 18.04-LTS -Version latest | `
Add-AzVMNetworkInterface -Id $nic.Id

# Create a virtual machine
New-AzVM -ResourceGroupName $resourceGroup -Location $location -VM $vmConfig

# Variables for common values
$resourceGroup = "web_rg"
$location = "westeurope"
$vmName = "machine2"
$VNet = "web_server_vnet"

# Create user object
#$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

# Create a virtual network
$vnet = Get-AzVirtualNetwork -ResourceGroupName $resourceGroup -Name $VNet

# Create a virtual network card and associate with public IP address and NSG
$nic = New-AzNetworkInterface -Name machine2-nic -ResourceGroupName $resourceGroup -Location $location `
  -SubnetId $vnet.Subnets[0].Id 

# Create a virtual machine configuration
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize Standard_B1s | `
Set-AzVMOperatingSystem -Linux -ComputerName $vmName -Credential $cred | `
Set-AzVMSourceImage -PublisherName Canonical -Offer UbuntuServer -Skus 18.04-LTS -Version latest | `
Add-AzVMNetworkInterface -Id $nic.Id

# Create a virtual machine
New-AzVM -ResourceGroupName $resourceGroup -Location $location -VM $vmConfig