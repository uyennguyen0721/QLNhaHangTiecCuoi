import React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import Home from './views/Home'
import Header from './components/Header'

export default function App () {
  return (
    <BrowserRouter>
      <Header />
      <Switch>
        <Route exact path="/home" component={Home}/>
      </Switch>
    </BrowserRouter>
  )
}
