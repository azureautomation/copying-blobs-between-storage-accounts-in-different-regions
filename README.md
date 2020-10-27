Copying blobs between storage accounts in different regions
===========================================================

            

Copying files, VHD’s and all contents located in a container from one storage account to another storage account using latest AZ power shell module.


Install the latest version of NewAzpowershell module by following this guide


[https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-1.3.0](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-1.3.0)


The fastest way to copy files between storage accounts is to use Azure Asynchronous Server-Side copy capability which is exposed through the Start-CopyAzureStorageBlob cmdlet.


Below PowerShell script will copy everything in a container to a container in another storage account. This can be across subscriptions and across regions. You need to replace the variables at the start with your own storage account names and storage account
 keys (which can be found through the Azure portal). You can also change the source and destination containers.


 


The Azure Storage Service exposes the ability to move a blob from one storage account to another. To do this, we have to perform the following steps:


Determine the source storage account information


Determine the destination storage account information


Ensure that the destination container exists in the destination storage account


Perform the blob copy


NOTE: Copying blobs between storage accounts in different regions can take up to one hour or more depending on the size of the blob. The easiest way to do this is through Azure Powershell:


 

 

 To check the status of files which are copied from one container to another, you can run the below script to get the result.


 

 

 


 


        
    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.
