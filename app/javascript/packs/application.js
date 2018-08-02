import "bootstrap";
import {clientQuery} from './client_query.js'

const Turbolinks = require("turbolinks")
Turbolinks.start()

document.addEventListener('DOMContentLoaded', () => {
  clientQuery.initializeForm();
  global.clientQuery = clientQuery;
})


