import React, { useEffect, useState } from 'react'
import HeaderSection from './HeaderSection'
import Footer from '../layout/Footer'
import '../css/feedback.css'
import cookies from 'react-cookies'
import Rating from 'react-rating';
import { useDispatch, useSelector } from 'react-redux';
import API, { endpoints } from "../../configs/API";
import { Link } from 'react-router-dom'
import { Button, Col, Form, Image, Row } from 'react-bootstrap'
import Moment from 'react-moment'
import { getRating } from '../ActionCreators/RatingCreators';

export default function Feedback () {
    const ratingUser = useSelector(state => state.rate.rate)
    let user = useSelector(state => state.user.user)
    const dispatch = useDispatch()

    const [comments, setComments] = useState([])
    const [commentContent, setCommentContent] = useState(null)
    const [changed, setChanged] = useState(1)

    let [rating, setRating] = useState(0)

    useEffect(() => {
        let loadRating = async () => {
            try{
                let res = await API.get(endpoints['rating'], {
                    headers: {
                        'Authorization': `Bearer ${cookies.load("access_token")}`
                    }
                })
                setRating(res.data.results[0].rate)
                dispatch(getRating(res.data))
            }catch (err) {
                console.error(err)
            }
        }

        loadRating()
    }, [])

    useEffect(() => {
        let loadComments = async () => {
            try{
                let res = await API.get(endpoints['comments'])
                setComments(res.data.results)
                // console.log(res.data.results)
            }catch (err) {
                console.error(err)
            }
        }
        loadComments()
    }, [changed])

    let img = (st) => {
        if (st !== null){
            let str1 = st.substr(0, 21);
            let str2 = st.substr(22);
            let str = str1.concat("/static/", str2);
            return <Image src={str} roundedCircle fluid />
        }
        else {
            return <Image src="/images/default-user.jpg" roundedCircle fluid/>
        }
    }

    const addComment = async (event) => {
        event.preventDefault()

        try {
            let res = await API.post(endpoints['add_comment'], {
                "content": commentContent
            }, {
                headers: {
                    "Authorization": `Bearer ${cookies.load("access_token")}`
                }
            })

            console.info(res.data)
            comments.push(res.data)
            setComments(comments)
            setChanged(comments.length)
        } catch (err) {
            console.error(err)
        }
    }


    const saveRating = async (rt) => {
        if (window.confirm("Bạn chắc chắn với đánh giá này?") == true) {
            if(rating === 0){
                try {
                    let res = await API.post(endpoints['rating'], {
                        "rate": rt
                    }, {
                        headers: {
                            "Authorization": `Bearer ${cookies.load("access_token")}`
                        }
                    })
                    setRating(res.data.results[0].rate)
                } catch (err) {
                    console.error(err)
                }
            }
            else{
                try {
                    let ratingId = ratingUser.results[0].id
                    let res = await API.put(endpoints['update_rating'](ratingId), {
                        "rate": rt
                    }, {
                        headers: {
                            "Authorization": `Bearer ${cookies.load("access_token")}`
                        }
                    })
                    setRating(res.data.results[0].rate)
                    console.info(rating)
                } catch (err) {
                    console.error(err)
                }
            }
        }
    }

    // console.log(rating)
    // console.log(comments)

    let r = ""
    let comment = <div style={{textAlign: "center"}}><em><Link to="/login">Đăng nhập</Link> để bình luận</em></div>
    if (user !== null && user !== undefined) {

        comment = <Form onSubmit={addComment}>
                    <Form.Group className="mb-3" controlId="commentContent">
                      <Form.Control as="textarea"
                                    value={commentContent}
                                    onChange={(event) => setCommentContent(event.target.value)}
                                    placeholder="Nhập nội dung bình luận..." rows={3} />
                    </Form.Group>
                    <div style={{textAlign: "right"}}>
                        <Button type="submit" variant="info">Thêm bình luận</Button>
                    </div>
                  </Form>

        r = <Rating
                emptySymbol={<img src="/images/star-empty.png" alt="star-empty" className="icon" />}
                fullSymbol={<img src="/images/star-full.png" alt="star-full" className="icon" />}
                initialRating={rating} onClick={saveRating}
            />
    }

    return (
        <>
            <HeaderSection
                src="/images/feedback-bg.jpg"
                name="Phản hồi đánh giá"
            />
            <div className="feedback-bg">
                <h1>Hãy cho chúng tôi biết đánh giá của bạn</h1>
                <div style={{textAlign: "center"}}>{r}</div>
                <div className="container" style={{marginTop: "3%", marginBottom: "3%"}}>
                    {comment}
                </div>
                <hr />
                <div className="container">
                    {comments.length!==0 && comments.map(c => <Row>
                                                <Col md={1} xs={3}>
                                                    {img(c.user.avatar)}
                                                </Col>
                                                <Col md={11} xs={9}>
                                                    <h5>{c.user.first_name} {c.user.last_name}</h5>
                                                    <p style={{fontSize: "14px"}}><Moment fromNow>{c.created_date}</Moment></p>
                                                    <p><em>{c.content}</em></p>
                                                </Col>
                                        </Row>)}
                </div>
            </div>
            <Footer/>
        </>
    )
}