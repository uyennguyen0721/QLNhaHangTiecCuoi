import React, { useState, useEffect } from 'react';
import { Button } from '../layout/Button';
import { Link } from 'react-router-dom';
import '../css/Navbar.css';
import { useDispatch, useSelector } from 'react-redux';
import { useHistory } from "react-router-dom";
import cookies from "react-cookies"
import { logoutUser } from '../ActionCreators/UserCreators';
import { Form, FormControl } from 'react-bootstrap';
import { Search } from 'react-bootstrap-icons';
import API, { endpoints } from '../../configs/API';
import { getLobby } from '../ActionCreators/LobbyCreators';

function Navbar() {
  const [click, setClick] = useState(false);
  const [button, setButton] = useState(true);
  const [navbar, setNavbar] = useState(false);
  const [q, setQ] = useState("")

  const handleCLick = () => setClick(!click);
  const closeMobileMenu = () => setClick(false);

  const history = useHistory()

  const user = useSelector(state => state.user.user)
  const lobby = useSelector(state => state.lobby.lobby)
  const dispatch = useDispatch()

  const [arrayLobby, setArrayLobby] = useState(lobby);

  const showButton = () => {
    if (window.innerWidth <= 960) {
      setButton(false);
    } else {
      setButton(true);
    }
  };

  useEffect(() => {
    async function fetchAPI () {
        let res = await API.get(endpoints['wedding_lobbies'])
        setArrayLobby(res.data.results)
        dispatch(getLobby(res.data))
    }
    fetchAPI()
  }, [])

  useEffect(() => {
    showButton();
  }, []);

  window.addEventListener('resize', showButton);

  const changeBackground = () => {
      if(window.scrollY >= 80){
          setNavbar(true);
      }
      else{
          setNavbar(false);
      }
  }

  window.addEventListener('scroll', changeBackground);

  const search = async (event) => {
    event.preventDefault()
    let arr = []
    let bit = false
    for(let i = 0; i < arrayLobby.length; i++){
        arr[i] = arrayLobby[i].name.toLowerCase();
    }

    for(let i = 0; i < arr.length; i++){
      if(arr[i].includes(q.toLowerCase()) === true){
        bit = true
        break
      }
    }

    if(bit === true){
      history.push(`/lobbies?q=${q}`);
    }
    else{
      history.push(`/menu-foods?q=${q}`)
    }
  }

  const logout = (event) => {
    event.preventDefault()

    cookies.remove("access_token")
    cookies.remove("user")
    dispatch(logoutUser())
    history.push("/")
  }

  const handleCLick1 = (event) => {
    closeMobileMenu();
    logout(event);
  }

  let path = <>
      <li>
        <Link className='nav-links-mobile' onClick={closeMobileMenu} to="/login">????ng nh???p</Link>
      </li>
    </>
  let path1 = <>
    {button && <Button buttonStyle='btn--outline' to="/register">????ng k??</Button>}
  </>
  if (user !== null && user !== undefined) {
    path1 = <>
      {button && <Button buttonStyle='btn--outline' to="/profile">{user.first_name} {user.last_name}</Button>}
    </>
    path = <>
      <li>
        <Link className='nav-links-mobile' onClick={handleCLick1}>????ng xu???t</Link>
      </li>
    </>
  }

  return (
    <>
      <nav className={navbar ? 'navbar active' : 'navbar'}>
        <div className='navbar-container'>
          <Link to='/' className='navbar-logo' onClick={closeMobileMenu}>
              <img src="/logo.png" alt="logo"/>
          </Link>
          <div className='menu-icon' onClick={handleCLick}>
            <i className={click ? 'fas fa-times' : 'fas fa-bars'} />
          </div>
          <ul className={click ? 'nav-menu active' : 'nav-menu'}>
            <li className='nav-item'>
              <Link to='/' className='nav-links' onClick={closeMobileMenu}>
                Trang ch???
              </Link>
            </li>
            <li className='nav-item'>
              <Link to='/lobbies' className='nav-links' onClick={closeMobileMenu}>
                S???nh ti???c
              </Link>
            </li>
            <li className='nav-item'>
              <Link to='/food-type' className='nav-links' onClick={closeMobileMenu}>
                Th???c ????n
              </Link>
            </li>
            <li className='nav-item'>
              <Link to='/menu-drink' className='nav-links' onClick={closeMobileMenu}>
                ????? u???ng
              </Link>
            </li>
            <li className='nav-item'>
              <Link to='/services' className='nav-links' onClick={closeMobileMenu}>
                D???ch v???
              </Link>
            </li>
            <li className='nav-item'>
              <Link to='/feedback' className='nav-links' onClick={closeMobileMenu}>
                Ph???n h???i
              </Link>
            </li>

            {path}
          </ul>
          {path1}
        </div>
        <Form className="d-flex search">
            <FormControl
              type="search"
              placeholder="Nh???p t??? kh??a..."
              className="mr-2"
              aria-label="Search"
              value={q}
              onChange={(event) => setQ(event.target.value)}
            />
            <Button onClick={search} buttonStyle="btn--primary">
              <Search size={20} />
            </Button>
        </Form>
      </nav>
    </>
  );
}

export default Navbar;