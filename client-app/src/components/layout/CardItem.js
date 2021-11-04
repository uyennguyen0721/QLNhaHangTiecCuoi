import React from 'react';
import { Link } from 'react-router-dom';

function CardItem(props) {
  return (
    <>
      <div className="col-md-4 col-xs-12">
        <div className="cards__item">
          <Link className='cards__item__link' to={props.path}>
            <figure className='cards__item__pic-wrap' /* data-category={String(props.label)} */>
              <img className='cards__item__img' alt="" src={props.src} />
            </figure>
            <div className='cards__item__info'>
              <h5 className='cards__item__text'>{props.text}</h5>
              <p>{props.price} Đ / {props.unit}</p>
            </div>
          </Link>
        </div>
      </div>
    </>
  );
}

export default CardItem;