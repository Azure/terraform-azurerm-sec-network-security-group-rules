locals {
  direction = {
    "outbound" = "Outbound",
    "inbound"  = "Inbound"
  }

  access = {
    "deny"  = "Deny",
    "allow" = "Allow"
  }

  protocol = {
    "tcp"  = "Tcp",
    "udp"  = "Udp",
    "icmp" = "Icmp",
    "any"  = "*"
  }

  entire_port_range    = "*"
  enitre_address_range = "0.0.0.0/0"

  service_tags = {
    "actiongroup"                        = "ActionGroup",
    "apimanagement"                      = "ApiManagement",
    "applicationinsightsavailability"    = "ApplicationInsightsAvailability",
    "appconfiguration"                   = "AppConfiguration",
    "appservice"                         = "AppService",
    "appservicemanagement"               = "AppServiceManagement",
    "azureactivedirectory"               = "AzureActiveDirectory",
    "azureactivedirectorydomainservices" = "AzureActiveDirectoryDomainServices",
    "azureadvancedthreatprotection"      = "AzureAdvancedThreatProtection",
    "azurebackup"                        = "AzureBackup",
    "azurebotservice"                    = "AzureBotService",
    "azurecloud"                         = "AzureCloud",
    "azurecognitivesearch"               = "AzureCognitiveSearch",
    "azureconnectors"                    = "AzureConnectors",
    "azurecontainerregistry"             = "AzureContainerRegistry",
    "azurecosmosdb"                      = "AzureCosmosDB",
    "azuredatabricks"                    = "AzureDatabricks",
    "azuredataexplorermanagement"        = "AzureDataExplorerManagement",
    "azuredatalake"                      = "AzureDataLake",
    "azuredevspaces"                     = "AzureDevSpaces",
    "azureeventgrid"                     = "AzureEventGrid",
    "azurefrontdoor.frontend"            = "AzureFrontDoor.Frontend",
    "azurefrontdoor.backend"             = "AzureFrontDoor.Backend",
    "azurefrontdoor.firstparty"          = "AzureFrontDoor.FirstParty",
    "azureinformationprotection"         = "AzureInformationProtection",
    "azureiothub"                        = "AzureIoTHub",
    "azurekeyvault"                      = "AzureKeyVault",
    "azureloadbalancer"                  = "AzureLoadBalancer",
    "azuremachinelearning"               = "AzureMachineLearning",
    "azuremonitor"                       = "AzureMonitor",
    "azureopendatasets"                  = "AzureOpenDatasets",
    "azureplatformdns"                   = "AzurePlatformDNS",
    "azureplatformimds"                  = "AzurePlatformIMDS",
    "azureplatformlkm"                   = "AzurePlatformLKM",
    "azureresourcemanager"               = "AzureResourceManager",
    "azuresignalr"                       = "AzureSignalR",
    "azuresiterecovery"                  = "AzureSiteRecovery",
    "azuretrafficmanager"                = "AzureTrafficManager",
    "batchnodemanagement"                = "BatchNodeManagement",
    "cognitiveservicesmanagement"        = "CognitiveServicesManagement",
    "datafactory"                        = "DataFactory",
    "datafactorymanagement"              = "DataFactoryManagement",
    "dynamics365formarketingemail"       = "Dynamics365ForMarketingEmail",
    "elasticafd"                         = "ElasticAFD",
    "eventhub"                           = "EventHub",
    "gatewaymanager"                     = "GatewayManager",
    "guestandhybridmanagement"           = "GuestAndHybridManagement",
    "hdinsight"                          = "HDInsight",
    "internet"                           = "Internet",
    "logicapps"                          = "LogicApps",
    "logicappsmanagement"                = "LogicAppsManagement",
    "microsoftcloudappsecurity"          = "MicrosoftCloudAppSecurity",
    "microsoftcontainerregistry"         = "MicrosoftContainerRegistry",
    "powerqueryonline"                   = "PowerQueryOnline",
    "servicebus"                         = "ServiceBus",
    "servicefabric"                      = "ServiceFabric",
    "sql"                                = "Sql",
    "sqlmanagement"                      = "SqlManagement",
    "storage"                            = "Storage",
    "storagesyncservice"                 = "StorageSyncService",
    "windowsvirtualdesktop"              = "WindowsVirtualDesktop",
    "virtualnetwork"                     = "VirtualNetwork"
  }

  rule_configurations = {
    "DenyInternetInBound" = {
      "priority"                   = 4096
      "direction"                  = local.direction.inbound
      "access"                     = local.access.deny
      "protocol"                   = local.protocol.any
      "source_port_range"          = local.entire_port_range
      "source_address_prefix"      = local.service_tags.internet
      "destination_port_range"     = local.entire_port_range
      "destination_address_prefix" = local.service_tags.virtualnetwork
    },
    "DenyInternetOutBound" = {
      "priority"                   = 4096
      "direction"                  = local.direction.outbound
      "access"                     = local.access.deny
      "protocol"                   = local.protocol.any
      "source_port_range"          = local.entire_port_range
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_range"     = local.entire_port_range
      "destination_address_prefix" = local.service_tags.internet
    }
  }

  rule_names = keys(local.rule_configurations)
}



