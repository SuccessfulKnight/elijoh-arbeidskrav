$outputFile = "C:\Users\Administrator.ELIJOH07-VS-01\temo\elijoh-arbeidskrav\leasing.csv"

$dhcpLeases = Get-DhcpServerv4Lease

$csvData = @()

foreach ($lease in $dhcpLeases){
    $csvData += [PSCustomObject]@{
        ScopeId = $lease.ScopeId
        IPAddress = $lease.IPAddress
        HostName = $lease.HostName
        ClientID = $lease.ClientID
        AddressState = $lease.AddressState
    }
}

$csvData | Export-Csv -Path $outputFile -Delimiter '|' -NoTypeInformation

Write-Host "DHCP Lease i $outputFile"