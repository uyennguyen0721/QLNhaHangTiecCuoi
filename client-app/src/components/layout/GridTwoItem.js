import React from 'react';

export default function GridTwoItem (props) {
    return (
        <div className="row grid__item">
            <div className="col-md-6 col-xs-12 grid__item__col">
                <img className="grid__item__img" alt="Introduction" src={props.src}/>
            </div>
            <div className="col-md-6 col-xs-12 grid__item__col">
                <h1 className="grid__item__title">{props.title}</h1>
                <p className="grid__item__text">{props.text}</p>
            </div>
        </div>
    )
}