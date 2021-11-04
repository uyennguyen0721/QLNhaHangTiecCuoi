import React from 'react';
import '../css/CardProcedure.css';

export default function CardProcedure (props) {
    return (
        <div className="card-procedure">
            <div className="subject">
                <img src={props.img} alt=""/>
                <div className="content">
                    <h2>{props.title}</h2>
                    <p class="move_text">{props.text}</p>
                    <div class="icon">
                        <ul>
                            <li>
                                <a href={props.link}>
                                    {props.name}
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    )
}