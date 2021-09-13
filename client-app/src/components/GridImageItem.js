import React from 'react';

export default function GridImageItem (props) {
    return (
        <>
            <figure class="effect-sarah">
                <img src={props.src} alt="images"/>
                <figcaption>
                    <h2>{props.title}</h2>
                    <p>{props.text}</p>
                </figcaption>
          </figure>
        </>
    )
}