import React from 'react';
import Navbar from './components/layout/Navbar';
import './App.css';
import Home from './components/pages/Home';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import Services from './components/pages/Services';
import Lobbies from './components/pages/Lobbies';
import LobbyDetail from './components/pages/LobbyDetail';
import MenuDrink from './components/pages/MenuDrink';
import FoodType from './components/pages/FoodType';
import MenuFood from './components/pages/MenuFood';
import MenuFoodDetail from './components/pages/MenuFoodDetail';
import Login from './components/pages/Login';
import Register from './components/pages/Register';
import MenuFoods from './components/pages/MenuFoods';
import WeddingService from './components/pages/WeddingService'
import ScrollToTop from './components/layout/ScrollToTop';
import ConferenceService from './components/pages/ConferenceService';
import BirthdayService from './components/pages/BirthdayService';
import ServiceDetail from './components/pages/ServiceDetail';
import Profile from './components/pages/Profile';
import Feedback from './components/pages/Feedback';
import BookParty from './components/pages/BookParty';

function App() {
  return (
      <BrowserRouter>
        <ScrollToTop />
        <Navbar />
        <Switch>
          <Route exact path='/' component={Home} />
          <Route exact path='/lobbies' component={Lobbies} />
          <Route exact path='/lobbies/:lobbyId' component={LobbyDetail} />
          <Route exact path='/food-type' component={FoodType} />
          <Route exact path='/food-type/:food_typeId/menu-foods' component={MenuFood}/>
          <Route exact path='/menu-drink' component={MenuDrink} />
          <Route exact path='/menu-foods/:foodId' component={MenuFoodDetail}/>
          <Route exact path='/menu-foods' component={MenuFoods} />
          <Route exact path='/services' component={Services} />
          <Route exact path='/service-type/:serviceId/services' component={ServiceDetail} />
          <Route exact path='/wedding-service' component={WeddingService} />
          <Route exact path='/conference-service' component={ConferenceService} />
          <Route exact path='/birthday-service' component={BirthdayService} />
          <Route exact path='/register' component={Register} />
          <Route exact path='/login' component={Login} />
          <Route exact path='/profile' component={Profile} />
          <Route exact path='/feedback' component={Feedback} />
          <Route exact path='/book-party' component={BookParty} />
        </Switch>
      </BrowserRouter>
  );
}

export default App;