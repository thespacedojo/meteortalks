Meteor.startup ->

  if ServiceConfiguration.configurations.find({service: 'meteor-developer'}).fetch().length is 0
    console.log "Registering meteor-developer configuration"
    ServiceConfiguration.configurations.insert
      service: "meteor-developer"
      clientId: Meteor.settings.mdClientId
      secret: Meteor.settings.mdSecret
