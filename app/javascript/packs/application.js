import "bootstrap";
import Rails from 'rails-ujs';
import { spaceQuery } from '../components/space_query.js'
import { autocomplete } from '../plugins/autocomplete';
import { chatController } from '../components/chat_controller';
import { bookingController } from '../components/booking_controller';
import { propController } from '../components/prop_controller';
import FileUploadWithPreview from 'file-upload-with-preview'
import 'file-upload-with-preview/dist/file-upload-with-preview.min.css'
import "../plugins/flatpickr"

Rails.start();

document.addEventListener('DOMContentLoaded', () => {
  spaceQuery.initialize();
  bookingController.initialize();
  propController.initialize();
  const upload = new FileUploadWithPreview('custom-file-container', true);
});
