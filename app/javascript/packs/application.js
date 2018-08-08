import "bootstrap";
import { spaceQuery } from './space_query.js'
import { autocomplete } from '../components/autocomplete';
import { chatController } from './chat_controller';

const Turbolinks = require("turbolinks")
Turbolinks.start()

document.addEventListener('turbolinks:load', () => {
  spaceQuery.startListening();
})
global.chatController = chatController;
