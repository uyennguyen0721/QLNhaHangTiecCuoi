import React, { useEffect, useRef, useState } from 'react'
import API, { endpoints } from '../../configs/API'
import "../css/Profile.css"
import cookies from 'react-cookies'
import { useSelector } from 'react-redux'
import { Button, Form, FormGroup, Modal } from 'react-bootstrap'
import { Input, Label } from 'reactstrap'
import Footer from '../layout/Footer';


export default function Profile () {
    const user = useSelector(state => state.user.user)

    const [show, setShow] = useState(false);

    const [email, setEmail] = useState("");
    const [phone, setPhone] = useState("");
    const [address, setAddress] = useState("");
    const avatar = useRef();

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    let [ profile, setProfile] = useState(user)

    useEffect(() => {
        async function fetchAPI () {
            let res = await API.get(endpoints['current-user'], {
                headers: {
                    'Authorization': `Bearer ${cookies.load("access_token")}`
                }
            })
            setProfile(res.data)
        }
        fetchAPI()
    }, [])

    const img = () => {
        if (profile.avatar !== null){
            let str1 = profile.avatar.substr(0, 21);
            let str2 = profile.avatar.substr(22);
            let str = str1.concat("/static/", str2);
            return <img src={str} alt="user"/>
        }
        else {
            return <img src="/images/default-user.jpg" alt="user"/>
        }
    }

    const editProfile = (event) => {
        event.preventDefault()
        const userId = profile.id;
        let editUser = async () => {
            const formData = new FormData()
            formData.append("email", email)
            formData.append("phone", phone)
            formData.append("address", address)
            formData.append("avatar", avatar.current.files[0])

            try {
                await API.patch(endpoints['update_user'](userId), formData, {
                    headers: {
                        "Content-Type": "multipart/form-data"
                    }
                })
                handleClose();
                window.location.reload()
            } catch (err) {
                console.error(err)
            }
        }
        editUser();
    }

    return (
        <>
            <div className="padding row">
                <div className="col-md-12">
                    <div className="card">
                        <img className="card-img-top" src="/images/profile-bg.jpg" alt="???nh minh h???a"/>
                        <div className="card-body little-profile text-center">
                            <div className="pro-img">
                                {img()}
                            </div>
                            <h2 className="m-b-0 h5">{profile.first_name} {profile.last_name}</h2>
                            <p>&#64; {profile.username}</p>
                            <button className="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded" data-abc="true" onClick={handleShow}>Ch???nh s???a</button>
                            <Modal show={show} onHide={handleClose}>
                                <Modal.Header closeButton>
                                    <Modal.Title>Ch???nh s???a th??ng tin c?? nh??n</Modal.Title>
                                </Modal.Header>
                                <Modal.Body>
                                    <Form onSubmit={editProfile}>
                                        <FormGroup>
                                            <Label>Email</Label>
                                            <Input
                                                type="email"
                                                placeholder="Email"
                                                value={email}
                                                onChange={event => setEmail(event.target.value)}
                                            />
                                        </FormGroup>
                                        <FormGroup>
                                            <Label>S??? ??i???n tho???i</Label>
                                            <Input
                                                type="phone"
                                                placeholder="Phone number"
                                                value={phone}
                                                onChange={event => setPhone(event.target.value)}
                                            />
                                        </FormGroup>
                                        <FormGroup>
                                            <Label>?????a ch???</Label>
                                            <Input
                                                type="text"
                                                placeholder="Address"
                                                value={address}
                                                onChange={event => setAddress(event.target.value)}
                                            />
                                        </FormGroup>
                                        <Form.Group className="mb-3" controlId="avatar">
                                            <Label>???nh ?????i di???n</Label>
                                            <Form.Control type="file" ref={avatar} className="form-control" />
                                        </Form.Group>
                                    </Form>
                                </Modal.Body>
                                <Modal.Footer>
                                    <Button variant="secondary" onClick={handleClose}>
                                        ????ng
                                    </Button>
                                    <Button variant="primary" onClick={editProfile}>
                                        L??u thay ?????i
                                    </Button>
                                </Modal.Footer>
                            </Modal>
                            <div className="text-center m-t-20" style={{marginTop: "5%", marginBottom: "2%"}}>
                                <div className="row m-t-20">
                                    <div className="col-md-3"></div>
                                    <div className="col-md-3 m-b-0 font-light"><h5 className="h5">H??? v?? t??n</h5></div>
                                    <div className="col-md-3">{profile.first_name} {profile.last_name}</div>
                                    <div className="col-md-3"></div>
                                </div>
                                <div className="row m-t-20">
                                    <div className="col-md-3"></div>
                                    <div className="col-md-3 m-b-0 font-light"><h5 className="h5">Email</h5></div>
                                    <div className="col-md-3">{profile.email}</div>
                                    <div className="col-md-3"></div>
                                </div>
                                <div className="row m-t-20">
                                    <div className="col-md-3"></div>
                                    <div className="col-md-3 m-b-0 font-light"><h5 className="h5">S??? ??i???n tho???i</h5></div>
                                    <div className="col-md-3">{profile.phone}</div>
                                    <div className="col-md-3"></div>
                                </div>
                                <div className="row m-t-20">
                                    <div className="col-md-3"></div>
                                    <div className="col-md-3 m-b-0 font-light"><h5 className="h5">?????a ch???</h5></div>
                                    <div className="col-md-4">{profile.address}</div>
                                    <div className="col-md-2"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <Footer />
        </>
    )
}