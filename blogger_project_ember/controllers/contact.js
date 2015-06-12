Blogger.ContactController = Ember.Controller.extend({
  actions: {
    sendMessage: function() {
      var message = prompt('Type your message here:');
    }
  }
});
