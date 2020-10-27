
#login to Azure account using below command  
Login-AzAccount -SubscriptionName "your subscription name" -Tenant "your tenant ID"  
Select-AzSubscription -SubscriptionName "Your subscription name" 
#Server side storage copy
$SourceStorageAccount = "your source storage account name"
$SourceStorageKey = "your source storage account key"
$DestStorageAccount = "your destination storage account name"
$DestStorageKey = "your destination storage account key"
$SourceStorageContainer = 'your source container name'
$DestStorageContainer = 'your destination container name'
$SourceStorageContext = New-AzStorageContext –StorageAccountName $SourceStorageAccount -StorageAccountKey $SourceStorageKey
$DestStorageContext = New-AzStorageContext –StorageAccountName $DestStorageAccount -StorageAccountKey $DestStorageKey

$Blobs = Get-AzStorageBlob -Context $SourceStorageContext -Container $SourceStorageContainer
$BlobCpyAry = @() #Create array of objects

#Do the copy of everything
foreach ($Blob in $Blobs)
{
   Write-Output "Moving $Blob.Name"
   $BlobCopy = Start-CopyAzureStorageBlob -Context $SourceStorageContext -SrcContainer $SourceStorageContainer -SrcBlob $Blob.Name `
      -DestContext $DestStorageContext -DestContainer $DestStorageContainer -DestBlob $Blob.Name
   $BlobCpyAry += $BlobCopy
} 



#Check Status
foreach ($BlobCopy in $BlobCpyAry)
{
   #Could ignore all rest and just run $BlobCopy | Get-AzureStorageBlobCopyState but I prefer output with % copied
   $CopyState = $BlobCopy | Get-AzStorageBlobCopyState
   $Message = $CopyState.Source.AbsolutePath + " " + $CopyState.Status + " {0:N2}%" -f (($CopyState.BytesCopied/$CopyState.TotalBytes)*100) 
   Write-Output $Message
}
