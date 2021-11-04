import React, { useEffect, useState } from 'react'
import CardItem from '../layout/CardItem';
import HeaderSection from "./HeaderSection";
import '../css/Cards.css'
import API, { endpoints } from '../../configs/API';
import { useParams } from 'react-router-dom';
import { Spinner } from 'react-bootstrap';
import Footer from '../layout/Footer';

export default function MenuFood () {

    let { food_typeId } = useParams()
    const [food, setFood] = useState([])

    useEffect(() => {
        async function fetchAPI () {
            let res = await API.get(endpoints['food_type_foods'](food_typeId))
            setFood(res.data)
        }
        fetchAPI()
    })

    if(food === null || food === undefined){
        return <Spinner animation="border"/>
    }

    return (
        <>
            <HeaderSection
                src="/images/foods-bg.jpg"
                name="Thực đơn"
            />
            <div className='cards'>
                <h1>Thực đơn đặc sắc</h1>
                <div className='cards__container'>
                    <div className='cards__wrapper'>
                        <div className='cards__items row'>
                            {
                                food.length!==0 && food.map(f =>
                                    <CardItem
                                        src={f.image}
                                        text={f.name}
                                        path= {`/menu-foods/${f.id}`}
                                        price={f.price}
                                        unit='10 phần'
                                        key={f.id}
                                    />
                                )
                            }
                        </div>
                    </div>
                </div>
            </div>
            <Footer />
        </>
    )
}