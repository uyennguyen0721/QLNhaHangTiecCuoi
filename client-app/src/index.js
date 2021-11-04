import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import { createStore } from 'redux';
import mainReducer from "./components/reducers/RootReducer"
import { Provider } from 'react-redux';
import reportWebVitals from './reportWebVitals';

const store = createStore(mainReducer)

ReactDOM.render(
    <Provider store={store}>
      <App />
    </Provider>,
    document.getElementById('root')
  );

  reportWebVitals();
