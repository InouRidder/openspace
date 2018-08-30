import "bootstrap";
import Rails from 'rails-ujs';
import { spaceQuery } from '../components/space_query.js'
import { autocomplete } from '../plugins/autocomplete';
import { chatController } from '../components/chat_controller';
import { bookingController } from '../components/booking_controller';
import "../plugins/flatpickr"

Rails.start();

document.addEventListener('DOMContentLoaded', () => {
  spaceQuery.startListening();
  bookingController.initialize();
});

global.chatController = chatController;
global.spaceQuery = spaceQuery;
