import { createRoot } from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import './scss/main.scss';
import App from './containers/App/App';
import * as serviceWorkerRegistration from './serviceWorkerRegistration';

const root = createRoot(document.getElementById('app'));

root.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>
);

serviceWorkerRegistration.register();
