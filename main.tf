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
  entire_address_range = "0.0.0.0/0"

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
    "DenyInternetInbound" = {
      "direction"                  = local.direction.inbound
      "access"                     = local.access.deny
      "protocol"                   = local.protocol.any
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.internet
      "destination_port_ranges"    = [local.entire_port_range]
      "destination_address_prefix" = local.service_tags.virtualnetwork
    },
    "DenyInternetOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.deny
      "protocol"                   = local.protocol.any
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = [local.entire_port_range]
      "destination_address_prefix" = local.service_tags.internet
    },
    "AllowHTTPInbound" = {
      "direction"                  = local.direction.inbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.internet
      "destination_port_ranges"    = ["80"]
      "destination_address_prefix" = local.service_tags.virtualnetwork
    },
    "AllowHTTPSInbound" = {
      "direction"                  = local.direction.inbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.internet
      "destination_port_ranges"    = ["443"]
      "destination_address_prefix" = local.service_tags.virtualnetwork
    },
    "AllowAPIManagementManagementEndpointInbound" = {
      "direction"                  = local.direction.inbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.apimanagement
      "destination_port_ranges"    = ["3443"]
      "destination_address_prefix" = local.service_tags.virtualnetwork
    },
    "AllowStorageOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = ["443"]
      "destination_address_prefix" = local.service_tags.storage
    },
    "AllowAzureActiveDirectoryOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = ["443"]
      "destination_address_prefix" = local.service_tags.azureactivedirectory
    },
    "AllowSQLOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = ["1443"]
      "destination_address_prefix" = local.service_tags.sql
    },
    "AllowEventHubOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = ["443", "5672", "5671"]
      "destination_address_prefix" = local.service_tags.eventhub
    },
    "AllowAzureFileShareOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = ["445"]
      "destination_address_prefix" = local.service_tags.storage
    },
    "AllowHealthMonitoringOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = ["443"]
      "destination_address_prefix" = local.service_tags.azurecloud
    },
    "AllowAzureMonitorOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = ["443", "1886"]
      "destination_address_prefix" = local.service_tags.azuremonitor
    },
    "AllowSMTPOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = ["25", "587", "25028"]
      "destination_address_prefix" = local.service_tags.internet
    },
    "AllowAPIManagementRedisCacheOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = ["6381", "6382", "6383"]
      "destination_address_prefix" = local.service_tags.virtualnetwork
    },
    "AllowAPIManagementRateLimitCounterOutbound" = {
      "direction"                  = local.direction.outbound
      "access"                     = local.access.allow
      "protocol"                   = local.protocol.tcp
      "source_port_ranges"         = [local.entire_port_range]
      "source_address_prefix"      = local.service_tags.virtualnetwork
      "destination_port_ranges"    = ["4290"]
      "destination_address_prefix" = local.service_tags.virtualnetwork
    }
  }

  rule_names = keys(local.rule_configurations)
}



