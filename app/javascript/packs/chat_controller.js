const chatController = {
  initialize: function(user_id) {
    this.messages = document.getElementById('messages');
    this.form = document.getElementById('message_content');
    this.user_id = user_id;
  },

  addMessage: function(messagePartial) {
    this.messages.insertAdjacentHTML('beforeend', messagePartial);
  },

  clearForm: function() {
    this.form.value = "";
  },

  receive: function(messageObj) {
    if (messageObj.current_user_id !== this.user_id) {
      this.addMessage(messageObj.message_partial)
    }
    this.scrollLastMessageIntoView();
  },

  scrollLastMessageIntoView: function() {
    const messages = document.querySelectorAll('.message');
    const lastMessage = messages[messages.length - 1];
    if (lastMessage !== undefined) {
      lastMessage.scrollIntoView();
    }
  }
}

export { chatController };
