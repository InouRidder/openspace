import "bootstrap";
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import { spaceQuery } from '../components/space_query.js'
import { autocomplete } from '../plugins/autocomplete';
import { chatController } from '../components/chat_controller';
import { bookingController } from '../components/booking_controller';
import "../plugins/flatpickr"

Turbolinks.start();
Rails.start();

document.addEventListener('turbolinks:load', () => {
  spaceQuery.startListening();
  bookingController.initialize();
});

global.chatController = chatController;
global.spaceQuery = spaceQuery;
