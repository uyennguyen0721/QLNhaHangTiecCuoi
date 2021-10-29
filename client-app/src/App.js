import React from 'react';
import Navbar from './components/Navbar';
import './App.css';
import Home from './components/pages/Home';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Services from './components/pages/Services';
import Lobbies from './components/pages/Lobbies';
import LobbyDetail from './components/pages/LobbyDetail';
import MenuDrink from './components/pages/MenuDrink';
import FoodType from './components/pages/FoodType';
import MenuFood from './components/pages/MenuFood';
import MenuFoodDetail from './components/pages/MenuFoodDetail';
import Login from './components/pages/Login';
import Register from './components/pages/Register';

function App() {
  return (
    <>
      <Router>
        <Navbar />
        <Switch>
          <Route exact path='/' component={Home} />
          <Route exact path='/lobbies' component={Lobbies} />
          <Route exact path='/lobbies/:lobbyId' component={LobbyDetail} />
          <Route exact path='/food-type' component={FoodType} />
          <Route exact path='/food-type/:food_typeId/menu-foods' component={MenuFood}/>
          <Route exact path='/menu_foods/:foodId' component={MenuFoodDetail}/>
          <Route exact path='/menu-drink' component={MenuDrink} />
          <Route path='/services' component={Services} />
          <Route exact path='/register' component={Register} />
          <Route exact path='/login' component={Login} />
        </Switch>
      </Router>
    </>
  );
}

export default App;