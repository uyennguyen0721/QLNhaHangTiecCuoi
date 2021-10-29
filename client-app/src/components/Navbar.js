import React, { useState, useEffect } from 'react';
import { Button } from './Button';
import { Link } from 'react-router-dom';
import './Navbar.css';
import { useDispatch, useSelector } from 'react-redux';
import { useHistory } from "react-router";
import cookies from "react-cookies"
import { logoutUser } from './ActionCreators/UserCreators';

function Navbar() {
  const [click, setClick] = useState(false);
  const [button, setButton] = useState(true);
  const [navbar, setNavbar] = useState(false);

  const handleCLick = () => setClick(!click);
  const closeMobileMenu = () => setClick(false);

  const history = useHistory()
  const user = useSelector(state => state.user.user)
  const dispatch = useDispatch()

  const showButton = () => {
    if (window.innerWidth <= 960) {
      setButton(false);
    } else {
      setButton(true);
    }
  };

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

  const logout = (event) => {
    event.preventDefault()

    cookies.remove("access_token")
    cookies.remove("user")
    dispatch(logoutUser())
  }

  const handleCLick1 = (event) => {
    closeMobileMenu();
    logout(event);
  }

  let path = <>
      <li>
        <Link className='nav-links-mobile' onClick={closeMobileMenu} to="/login">Đăng nhập</Link>
      </li>
    </>
  let path1 = <>
    {button && <Button buttonStyle='btn--outline' to="/register">Đăng ký</Button>}
  </>
  if (user !== null && user !== undefined) {
    path1 = <>
      {button && <Button buttonStyle='btn--outline' to="/">{user.username}</Button>}
    </>
    path = <>
      <li>
        <Link className='nav-links-mobile' onClick={handleCLick1}>Đăng xuất</Link>
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
                Trang chủ
              </Link>
            </li>
            <li className='nav-item'>
              <Link
                to='/lobbies'
                className='nav-links'
                onClick={closeMobileMenu}
              >
                Sảnh tiệc
              </Link>
            </li>
            <li className='nav-item'>
              <Link
                to='/food-type'
                className='nav-links'
                onClick={closeMobileMenu}
              >
                Thực đơn
              </Link>
            </li>
            <li className='nav-item'>
              <Link
                to='/menu-drink'
                className='nav-links'
                onClick={closeMobileMenu}
              >
                Đồ uống
              </Link>
            </li>
            <li className='nav-item'>
              <Link
                to='/products'
                className='nav-links'
                onClick={closeMobileMenu}
              >
                Dịch vụ
              </Link>
            </li>

            {path}
          </ul>
          {path1}
        </div>
      </nav>
    </>
  );
}

export default Navbar;