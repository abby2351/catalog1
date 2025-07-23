@description('Name of the Static Web App')
param staticWebAppName string

@description('Location for the Static Web App')
param location string = resourceGroup().location

@description('Repository URL of the source code')
param repoUrl string

@description('Branch to deploy from')
param branch string = 'main'

resource staticWebApp 'Microsoft.Web/staticSites@2023-06-01' = {
  name: staticWebAppName
  location: location
  properties: {
    repositoryUrl: repoUrl
    branch: branch
    buildProperties: {
      apiLocation: ''
      appLocation: '/'
      outputLocation: 'build'
    }
  }
}
