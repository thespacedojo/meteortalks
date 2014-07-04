Meteor.startup ->

  if not Meteor.settings.mdClientId? and not Meteor.settings.mdSecret?
    console.log 'Meteor settings are invalid. Please, pass a settings file on startup.\n'
    console.log '  meteor --settings settings.json\n'
    console.log 'Or create METEOR_SETTINGS environment variable with settings JSON content.\n'
    console.log '  export METEOR_SETTINGS="$(cat /path/to/settings.json)"\n'
    console.log 'More information here: https://github.com/arunoda/meteor-up\n'
    console.log '* Create a Meteor Developer account here: https://www.meteor.com/account-settings'
    console.log '* Add a new app (Your Developer Account Apps section)'
    console.log '* Redirect URL must be: "http://localhost:3000/_oauth/meteor-developer?close"'
    console.log '* Create a file named "settings.json"'
    console.log '* Set your app ID into "mdclientId" key'
    console.log '* Set your app secret into "mdSecret" key\n'
    console.log 'Example:\n'
    console.log '{"mdClientId": "your-client-id", "mdSecret": "your-client-secret"}\n'

  if ServiceConfiguration.configurations.find({service: 'meteor-developer'}).fetch().length is 0
    console.log "Registering meteor-developer configuration"
    ServiceConfiguration.configurations.insert
      service: "meteor-developer"
      clientId: Meteor.settings.mdClientId
      secret: Meteor.settings.mdSecret
