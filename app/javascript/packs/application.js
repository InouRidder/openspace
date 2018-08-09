import "bootstrap";
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import { spaceQuery } from './space_query.js'
import { autocomplete } from '../components/autocomplete';
import { chatController } from './chat_controller';

Turbolinks.start();
Rails.start();
document.addEventListener('turbolinks:load', () => {
  spaceQuery.startListening();
});

global.chatController = chatController;
global.spaceQuery = spaceQuery;
