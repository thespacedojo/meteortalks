module.exports = function() {
  this.Given(/^a talk exists with a youtube id "([^"]*)"$/, function (youtubeId, callback) {
    Video.destroyAll();
    Meteor.call('addVideo', {youtubeId: youtubeId}) 
    callback();
  });

  this.When(/^I visit the homepage$/, function (callback) {
    this.zombie.home(callback)
  });

  this.Then(/^I should see a title "([^"]*)"$/, function (talkName, callback) {
      title = this.zombie.browser.text("h4")
      if (title === talkName) {
        return callback();
      } else {
        callback.fail("Can't find a matching talk");
      }
  });

  this.When(/^I search for "([^"]*)"$/, function (term, finished) {
    this.zombie.browser.fill('query', term)
    this.zombie.browser.pressButton(".search", function() {
      finished();
    })
  });

  this.Then(/^I should be on the search page with a param of "([^"]*)"$/, function (term, callback) {
    if (this.zombie.browser.location.pathname === "/search/" + term) {
      callback();
    } else { 
      callback.fail("Term didn't the url given")
    }
  });
}
