import "bootstrap";
import {clientQuery} from './client_query.js'
import { autocomplete } from '../components/autocomplete';

const Turbolinks = require("turbolinks")
Turbolinks.start()

document.addEventListener('DOMContentLoaded', () => {
  clientQuery.startListening();
})


