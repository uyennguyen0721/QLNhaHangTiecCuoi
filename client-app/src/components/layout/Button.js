import React from 'react';
import '../css/Button.css';
import { Link } from 'react-router-dom';

const STYLES = ['btn--primary', 'btn--outline', 'btn--test', 'btn--secondary'];

const SIZES = ['btn--medium', 'btn--large', 'btn--medium--secondary'];

/* const LINKS = ['/sign-up', '/lobbies']; */

export const Button = ({
  children,
  to,
  type,
  onClick,
  buttonStyle,
  buttonSize
 /*  buttonLink */
}) => {
  const checkButtonStyle = STYLES.includes(buttonStyle)
    ? buttonStyle
    : STYLES[0];

  const checkButtonSize = SIZES.includes(buttonSize) ? buttonSize : SIZES[0];
  /* const checkButtonLink = LINKS.includes(buttonLink) ? buttonLink : LINKS[0]; */

  return (
    <Link to={to} className='btn-mobile'> {/* `${checkButtonLink}`*/ }
      <button
        className={`btn ${checkButtonStyle} ${checkButtonSize}`}
        onClick={onClick}
        type={type}
      >
        {children}
      </button>
    </Link>
  );
};