import React from 'react'
import HeaderSection from './HeaderSection'
import Footer from '../layout/Footer'
import '../css/feedback.css'
import Rating from 'react-rating';
import { useSelector } from 'react-redux';
import API, { endpoints } from "../../configs/API";

export default function Feedback () {
    let user = useSelector(state => state.user.user)
    let r = ""
    if (user !== null && user !== undefined) {

        r = <Rating
                emptySymbol={<img src="/images/star-empty.png" alt="" className="icon" />}
                fullSymbol={<img src="/images/star-full.png" alt="" className="icon" />}
            />
    }
    // const saveRating = async (rate) => {
    //     if (window.confirm("Ban muon danh gia bai hoc nay?") == true) {
    //         try {
    //             let res = await API.post(endpoints['rating'](lessonId), {
    //                 "rating": rate
    //             }, {
    //                 headers: {
    //                     "Authorization": `Bearer ${cookies.load("access_token")}`
    //                 }
    //             })
    //             console.info(res.data)
    //         } catch (err) {
    //             console.error(err)
    //         }
    //     }
    // }

    return (
        <>
            <HeaderSection
                src="/images/feedback-bg.jpg"
                name="Phản hồi đánh giá"
            />
            <div className="feedback-bg">
                <h1>Hãy cho chúng tôi biết đánh giá của bạn nào</h1>
                {r}
            </div>
            <Footer/>
        </>
    )
}