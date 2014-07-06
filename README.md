# Meteor Talks

Source code that powers [Meteor Talks](http://meteortalks.com).

## Installation

### Prerequisites

* You must have a [Meteor Developer account](https://www.meteor.com/account-settings)
* Don't have one yet? Create one. It's free.
* Go to your Meteor Developer account settings page
* Add a new app (*Your Developer Account Apps* section)
* Set a name (whatever)
* Redirect URL must be: `http://localhost:3000/_oauth/meteor-developer?close`
* Create a file (anywhere on your machine) named `settings.json`
* Set your app ID into `mdclientId` key
* Set your app secret into `mdSecret` key

Example:

```js
{
  "mdClientId": "your-client-id",
  "mdSecret": "your-client-secret"
}
```

Then you will pass this settings file to Meteor via the `--settings` option:

```
$ mrt --settings /path/to/settings.json
```

More information here:

* [Meteor Up](https://github.com/arunoda/meteor-up)
* [EventedMind — Organizing Environment Variables and Settings](https://www.eventedmind.com/feed/meteor-organizing-environment-variables-and-settings)

### Clone and Run

Clone the repository and move into:

```
$ git clone https://github.com/Differential/meteortalks.git
$ cd meteortalks
```

Then run Meteor with the settings file:

```
$ mrt --settings /path/to/settings.json
```

Go to `http://localhost:3000`.
