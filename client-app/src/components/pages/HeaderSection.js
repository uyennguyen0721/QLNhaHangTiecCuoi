import React from 'react';
import '../../App.css';
import '../css/HeaderSection.css';

function HeaderSection (props) {
  return (
    <div className='header-container'>
      <img src={props.src} alt="header-bg"/>
      <h1>{props.name}</h1>
      <p>Trang chủ <i className="fas fa-angle-double-right"/> {props.name}</p>
    </div>
  );
}

export default HeaderSection;