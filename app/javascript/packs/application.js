import "bootstrap";
import {clientQuery} from './client_query.js'

clientQuery.initializeForm();
console.log('hello');
global.clientQuery = clientQuery;
