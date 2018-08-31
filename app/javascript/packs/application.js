import "bootstrap";
import Rails from 'rails-ujs';
import { spaceQuery } from '../components/space_query.js'
import { autocomplete } from '../plugins/autocomplete';
import { chatController } from '../components/chat_controller';
import { bookingController } from '../components/booking_controller';
import { propController } from '../components/prop_controller';
import "../plugins/flatpickr"

Rails.start();

document.addEventListener('DOMContentLoaded', () => {
  spaceQuery.startListening();
  bookingController.initialize();
  propController.initialize();
});

global.chatController = chatController;
global.spaceQuery = spaceQuery;
