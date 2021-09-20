import React from "react";
import Footer from "../Footer";
import HeaderSection from "../HeaderSection";

export default function MenuFoodDetail () {
    return(
        <>
            <HeaderSection
                src="/images/foods-bg.jpg"
                name="Thực đơn"
            />
            <div className="food-detail row">
                <div className="col-md-6 col-xs-12">
                    <img src="/images/wedding.jpg" alt="img"/>
                </div>
                <div class="col-md-6 col-xs-12">
                    <h1>Name</h1>
                </div>
            </div>
            <Footer/>
        </>
    )
}