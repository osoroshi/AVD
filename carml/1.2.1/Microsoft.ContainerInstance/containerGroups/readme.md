# Container Instances `[Microsoft.ContainerInstance/containerGroups]`

## Navigation

- [Resource types](#Resource-types)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)
- [Deployment examples](#Deployment-examples)

### Container groups in Azure Container Instances

The top-level resource in Azure Container Instances is the container group. A container group is a collection of containers that get scheduled on the same host machine. The containers in a container group share a lifecycle, resources, local network, and storage volumes. It's similar in concept to a pod in Kubernetes.

## Resource types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Authorization/locks` | [2017-04-01](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2017-04-01/locks) |
| `Microsoft.ContainerInstance/containerGroups` | [2021-10-01](https://docs.microsoft.com/en-us/azure/templates/Microsoft.ContainerInstance/2021-10-01/containerGroups) |

## Parameters

**Required parameters**

| Parameter Name | Type | Description |
| :-- | :-- | :-- |
| `containers` | array | The containers and their respective config within the container group. |
| `name` | string | Name for the container group. |

**Optional parameters**

| Parameter Name | Type | Default Value | Allowed Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `enableDefaultTelemetry` | bool | `True` |  | Enable telemetry via the Customer Usage Attribution ID (GUID). |
| `imageRegistryCredentials` | array | `[]` |  | The image registry credentials by which the container group is created from. |
| `ipAddressPorts` | array | `[]` |  | Ports to open on the public IP address. Must include all ports assigned on container level. |
| `ipAddressType` | string | `'Public'` |  | Specifies if the IP is exposed to the public internet or private VNET. - Public or Private. |
| `location` | string | `[resourceGroup().location]` |  | Location for all Resources. |
| `lock` | string | `''` | `['', CanNotDelete, ReadOnly]` | Specify the type of lock. |
| `osType` | string | `'Linux'` |  | The operating system type required by the containers in the container group. - Windows or Linux. |
| `restartPolicy` | string | `'Always'` |  | Restart policy for all containers within the container group. - Always: Always restart. OnFailure: Restart on failure. Never: Never restart. - Always, OnFailure, Never. |
| `systemAssignedIdentity` | bool | `False` |  | Enables system assigned managed identity on the resource. |
| `tags` | object | `{object}` |  | Tags of the resource. |
| `userAssignedIdentities` | object | `{object}` |  | The ID(s) to assign to the resource. |


### Parameter Usage: `imageRegistryCredentials`

The image registry credentials by which the container group is created from.

<details>

<summary>Parameter JSON format</summary>

```json
"imageRegistryCredentials": {
    "value": [
        {
            "server": "sxxazacrx001.azurecr.io",
            "username": "sxxazacrx001"
        }
    ]
}
```

</details>

<details>

<summary>Bicep format</summary>

```bicep
imageRegistryCredentials: [
    {
        server: 'sxxazacrx001.azurecr.io'
        username: 'sxxazacrx001'
    }
]
```

</details>
<p>

### Parameter Usage: `tags`

Tag names and tag values can be provided as needed. A tag can be left without a value.

<details>

<summary>Parameter JSON format</summary>

```json
"tags": {
    "value": {
        "Environment": "Non-Prod",
        "Contact": "test.user@testcompany.com",
        "PurchaseOrder": "1234",
        "CostCenter": "7890",
        "ServiceName": "DeploymentValidation",
        "Role": "DeploymentValidation"
    }
}
```

</details>

<details>

<summary>Bicep format</summary>

```bicep
tags: {
    Environment: 'Non-Prod'
    Contact: 'test.user@testcompany.com'
    PurchaseOrder: '1234'
    CostCenter: '7890'
    ServiceName: 'DeploymentValidation'
    Role: 'DeploymentValidation'
}
```

</details>
<p>

### Parameter Usage: `userAssignedIdentities`

You can specify multiple user assigned identities to a resource by providing additional resource IDs using the following format:

<details>

<summary>Parameter JSON format</summary>

```json
"userAssignedIdentities": {
    "value": {
        "/subscriptions/<<subscriptionId>>/resourcegroups/validation-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/adp-sxx-az-msi-x-001": {},
        "/subscriptions/<<subscriptionId>>/resourcegroups/validation-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/adp-sxx-az-msi-x-002": {}
    }
}
```

</details>

<details>

<summary>Bicep format</summary>

```bicep
userAssignedIdentities: {
    '/subscriptions/<<subscriptionId>>/resourcegroups/validation-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/adp-sxx-az-msi-x-001': {}
    '/subscriptions/<<subscriptionId>>/resourcegroups/validation-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/adp-sxx-az-msi-x-002': {}
}
```

</details>
<p>

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `iPv4Address` | string | The IPv4 address of the container group. |
| `location` | string | The location the resource was deployed into. |
| `name` | string | The name of the container group. |
| `resourceGroupName` | string | The resource group the container group was deployed into. |
| `resourceId` | string | The resource ID of the container group. |
| `systemAssignedPrincipalId` | string | The principal ID of the system assigned identity. |

## Cross-referenced modules

_None_

## Deployment examples

The following module usage examples are retrieved from the content of the files hosted in the module's `.test` folder.
   >**Note**: The name of each example is based on the name of the file from which it is taken.

   >**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

<h3>Example 1: Common</h3>

<details>

<summary>via Bicep module</summary>

```bicep
module containerGroups './Microsoft.ContainerInstance/containerGroups/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-test-cicgcom'
  params: {
    // Required parameters
    containers: [
      {
        name: '<<namePrefix>>-az-aci-x-001'
        properties: {
          command: []
          environmentVariables: []
          image: 'mcr.microsoft.com/azuredocs/aci-helloworld'
          ports: [
            {
              port: '80'
              protocol: 'Tcp'
            }
            {
              port: '443'
              protocol: 'Tcp'
            }
          ]
          resources: {
            requests: {
              cpu: 2
              memoryInGB: 2
            }
          }
        }
      }
      {
        name: '<<namePrefix>>-az-aci-x-002'
        properties: {
          command: []
          environmentVariables: []
          image: 'mcr.microsoft.com/azuredocs/aci-helloworld'
          ports: [
            {
              port: '8080'
              protocol: 'Tcp'
            }
          ]
          resources: {
            requests: {
              cpu: 2
              memoryInGB: 2
            }
          }
        }
      }
    ]
    name: '<<namePrefix>>cicgcom001'
    // Non-required parameters
    ipAddressPorts: [
      {
        port: 80
        protocol: 'Tcp'
      }
      {
        port: 443
        protocol: 'Tcp'
      }
    ]
    lock: 'CanNotDelete'
    systemAssignedIdentity: true
    userAssignedIdentities: {
      '<managedIdentityResourceId>': {}
    }
  }
}
```

</details>
<p>

<details>

<summary>via JSON Parameter file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "containers": {
      "value": [
        {
          "name": "<<namePrefix>>-az-aci-x-001",
          "properties": {
            "command": [],
            "environmentVariables": [],
            "image": "mcr.microsoft.com/azuredocs/aci-helloworld",
            "ports": [
              {
                "port": "80",
                "protocol": "Tcp"
              },
              {
                "port": "443",
                "protocol": "Tcp"
              }
            ],
            "resources": {
              "requests": {
                "cpu": 2,
                "memoryInGB": 2
              }
            }
          }
        },
        {
          "name": "<<namePrefix>>-az-aci-x-002",
          "properties": {
            "command": [],
            "environmentVariables": [],
            "image": "mcr.microsoft.com/azuredocs/aci-helloworld",
            "ports": [
              {
                "port": "8080",
                "protocol": "Tcp"
              }
            ],
            "resources": {
              "requests": {
                "cpu": 2,
                "memoryInGB": 2
              }
            }
          }
        }
      ]
    },
    "name": {
      "value": "<<namePrefix>>cicgcom001"
    },
    // Non-required parameters
    "ipAddressPorts": {
      "value": [
        {
          "port": 80,
          "protocol": "Tcp"
        },
        {
          "port": 443,
          "protocol": "Tcp"
        }
      ]
    },
    "lock": {
      "value": "CanNotDelete"
    },
    "systemAssignedIdentity": {
      "value": true
    },
    "userAssignedIdentities": {
      "value": {
        "<managedIdentityResourceId>": {}
      }
    }
  }
}
```

</details>
<p>

<h3>Example 2: Min</h3>

<details>

<summary>via Bicep module</summary>

```bicep
module containerGroups './Microsoft.ContainerInstance/containerGroups/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-test-cicgmin'
  params: {
    // Required parameters
    containers: [
      {
        name: '<<namePrefix>>-az-aci-x-001'
        properties: {
          image: 'mcr.microsoft.com/azuredocs/aci-helloworld'
          ports: [
            {
              port: '443'
              protocol: 'Tcp'
            }
          ]
          resources: {
            requests: {
              cpu: 2
              memoryInGB: 2
            }
          }
        }
      }
    ]
    name: '<<namePrefix>>cicgmin001'
    // Non-required parameters
    ipAddressPorts: [
      {
        port: 443
        protocol: 'Tcp'
      }
    ]
  }
}
```

</details>
<p>

<details>

<summary>via JSON Parameter file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "containers": {
      "value": [
        {
          "name": "<<namePrefix>>-az-aci-x-001",
          "properties": {
            "image": "mcr.microsoft.com/azuredocs/aci-helloworld",
            "ports": [
              {
                "port": "443",
                "protocol": "Tcp"
              }
            ],
            "resources": {
              "requests": {
                "cpu": 2,
                "memoryInGB": 2
              }
            }
          }
        }
      ]
    },
    "name": {
      "value": "<<namePrefix>>cicgmin001"
    },
    // Non-required parameters
    "ipAddressPorts": {
      "value": [
        {
          "port": 443,
          "protocol": "Tcp"
        }
      ]
    }
  }
}
```

</details>
<p>
