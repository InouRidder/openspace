import "bootstrap";
import { spaceQuery } from './space_query.js'
import { autocomplete } from '../components/autocomplete';

const Turbolinks = require("turbolinks")
Turbolinks.start()

document.addEventListener('turbolinks:load', () => {
  spaceQuery.startListening();
})


