import React from 'react';

export default function GridTwoItem (props) {
    return (
        <div className="row grid__item">
            <div className="col col-xl-6 grid__item__col">
                <img className="grid__item__img" alt="Introduction Image" src={props.src}/>
            </div>
            <div className="col col-xl-6 grid__item__col">
                <h1 className="grid__item__title">{props.title}</h1>
                <p className="grid__item__text">{props.text}</p>
            </div>
        </div>
    )
}