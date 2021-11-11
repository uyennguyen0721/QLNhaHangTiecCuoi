import React, { useEffect, useState } from "react";
import API, { endpoints } from "../../configs/API";
import CardItem from "../layout/CardItem";
import '../css/Cards.css'
import Footer from "../layout/Footer";
import HeaderSection from "./HeaderSection";

export default function MenuDrink () {

    const [drink, setDrink] = useState([])

    useEffect(() => {
        async function fetchAPI () {
            let res = await API.get(endpoints['menu_drinks'])
            setDrink(res.data.results)
        }
        fetchAPI()
    }, [])

    return (
        <>
            <HeaderSection
                src="/images/drinks-bg.jpg"
                name="Đồ uống"
            />
            <div className='cards'>
                <h1>Danh sách đồ uống</h1>
                <div className='cards__container'>
                <p>
                    Đi kèm với hơn các món ăn trong bữa tiệc, trên bàn tiệc của thực khách sẽ không thể thiếu những thức uống ngọt ngào, mát lạnh khiến bữa ăn trở lên càng tuyệt vời. Bên cạnh đó, GLORIAN còn phục vụ các loại rượu vang, champagne từ Pháp, Chile, Australia, ... đến các loại bia như Heineken, Tiger, Sapporo, ... 
                </p>
                    <div className='cards__wrapper'>
                        <div className='cards__items row'>
                            {
                                drink.length!==0 && drink.map(d =>
                                    <CardItem
                                        src={d.image}
                                        text={d.name}
                                        path= '/menu-drink'
                                        price={d.price}
                                        unit={d.unit}
                                        key={d.id}
                                    />
                                )
                            }
                        </div>
                    </div>
                </div>
            </div>
            <Footer/>
        </>
    )
}