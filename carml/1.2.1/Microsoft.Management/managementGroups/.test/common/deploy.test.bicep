targetScope = 'managementGroup'

// ========== //
// Parameters //
// ========== //
@description('Optional. A short identifier for the kind of deployment. Should be kept short to not run into resource-name length-constraints.')
param serviceShort string = 'mmgcom'

// ============== //
// Test Execution //
// ============== //

module testDeployment '../../deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-test-${serviceShort}'
  params: {
    name: '<<namePrefix>>${serviceShort}001'
    displayName: 'Test MG'
    parentId: last(split(managementGroup().id, '/'))
  }
}
