import React, { useEffect, useState } from "react";
import { Spinner } from "react-bootstrap";
import { useParams } from "react-router";
import API, { endpoints } from "../../configs/API";
import Footer from "../Footer";
import HeaderSection from "../HeaderSection";
import '../MenuFoodDetail.css'

export default function MenuFoodDetail () {

    let { foodId } = useParams()
    let [ foods, setFoods] = useState([])

    useEffect(() => {
        async function fetchAPI () {
        let res = await API.get(endpoints['menu_foods_detail'](foodId))
        setFoods(res.data)
        }
        fetchAPI()
    })

    if(foods === null || foods === undefined){
        return <Spinner animation="border"/>
    }

    return(
        <>
            <HeaderSection
                src="/images/foods-bg.jpg"
                name="Thực đơn"
            />
            <div className="food-detail">
                <h2>Thông tin món ăn</h2>
                <div className="row">
                    <div className="col-md-6 col-xs-12">
                        <img src={foods.image} alt="img"/>
                    </div>
                    <div className="col-md-6 col-xs-12">
                        <h1>{foods.name}</h1>
                        <ul>
                            <li>Giá: {foods.price} Đ / 10 phần</li>
                            <li>Là món chay: {(foods.is_vegetarian !== false) ? "Có" : "Không"}</li>
                        </ul>
                        <p>{foods.description}</p>

                    </div>
                </div>
            </div>
            <Footer/>
        </>
    )
}