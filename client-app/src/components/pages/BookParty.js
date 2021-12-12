import React, { useEffect, useState } from 'react'
import { Col, Form, Row, Button, Modal } from 'react-bootstrap'
import DatePicker from 'react-datepicker'
import { Input, Label } from 'reactstrap'
import "../css/BookParty.css"
import Footer from '../layout/Footer'
import HeaderSection from './HeaderSection'
import Select from 'react-select'
import "react-datepicker/dist/react-datepicker.css"
import API, { endpoints } from '../../configs/API'

const style = {
    marginTop: "2%"
}

const Checkbox = ({ type = "checkbox", name, checked = false, onChange }) => {
    console.log("Checkbox: ", name, checked);
    return (
      <input type={type} name={name} checked={checked} onChange={onChange} />
    );
  };

export default function BookParty () {
    const [startDate, setStartDate] = useState(new Date());
    const [tableQuantity, setTableQuantity] = useState(0);
    const [session, setSession] = useState(1);
    const [partyName, setPartyName] = useState("")
    const [getLobby, setGetLobby] = useState([])
    const [lobbyId, setLobbyId] = useState(1)
    const [getFood, setGetFood] = useState([])
    const [checkedItems, setCheckedItems] = useState({});
    const today = new Date()

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const [show1, setShow1] = useState(false);

    const handleClose1 = () => setShow1(false);
    const handleShow1 = () => setShow1(true);

    const options = [
        { value: 1, label: 'Buổi sáng' },
        { value: 2, label: 'Buổi trưa' },
        { value: 3, label: 'Buổi chiều' }
    ]

    const handleChange = event => {
        setCheckedItems({
            ...checkedItems,
            [event.target.name]: event.target.checked
        });
        console.log("checkedItems: ", checkedItems);
      };

    useEffect(() => {
        let getLobbies = async () => {
            try {
                let res = await API.get(`${endpoints['wedding_lobbies']}`)
                setGetLobby(res.data.results)
            }
            catch (err) {
                console.error(err)
            }
        }

        let getFoods = async () => {
            try {
                let res = await API.get(`${endpoints['menu_foods']}`)
                setGetFood(res.data.results)
            }
            catch (err) {
                console.error(err)
            }
        }
        getLobbies()
        getFoods()
    }, [])

    console.log(getFood)

    const listLobby = () => {
        let options1 = []
        for(let i = 0; i < getLobby.length; i++){
            options1.push({
                value: getLobby[i].id, label: getLobby[i].name
            });
        }
        return options1;
    }

    // console.info(session)
    // console.info(startDate)
    // console.info(getLobby)
    // console.info(listLobby())
    // console.info(lobbyId)
    return (
        <>
            <HeaderSection
                src="/images/bookparty-bg.jpg"
                name="Đặt tiệc"
            />
            <div className='cards'>
                <h1>Đặt tiệc</h1>
                <Row style={style}>
                    <Col md={2}></Col>
                    <Col md={8} className="card">
                        <Form>
                            <Row style={style}>
                                <Col md={3} xs={12}><Label><b>Tên buổi tiệc</b></Label></Col>
                                <Col md={9} xs={12}><Input type="text" value={partyName} onChange={(event) => setPartyName(event.target.value)}/></Col>
                            </Row>
                            <Row style={style}>
                                <Col md={3} xs={12}><Label><b>Số lượng bàn</b></Label></Col>
                                <Col md={9} xs={12}><Input type="number" value={tableQuantity} defaultValue={0} min={0} onChange={(event) => setTableQuantity(event.target.value)}/></Col>
                            </Row>
                            <Row>
                                <Col md={3} xs={12} style={style}><Label><b>Thời gian tổ chức</b></Label></Col>
                                <Col md={4} xs={12} style={style}>
                                    <DatePicker
                                        selected={startDate}
                                        minDate={today}
                                        dateFormat="dd/MM/yyyy"
                                        onChange={(date) => setStartDate(date)}
                                    />
                                </Col>
                                <Col md={5} xs={12} style={style}>
                                    <Select
                                        selected={session}
                                        options={options}
                                        onChange={(session1) => setSession(session1.value)}
                                    />
                                </Col>
                            </Row>
                            <Row style={style}>
                                <Col md={3} xs={12}><Label><b>Chọn sảnh</b></Label></Col>
                                <Col md={9} xs={12}>
                                    <Select
                                        selected={lobbyId}
                                        options={listLobby()}
                                        onChange={(lobbyId1) => setLobbyId(lobbyId1.value)}
                                    />
                                </Col>
                            </Row>
                            <Row style={style}>
                                <Col md={3} xs={12}><Label><b>Chọn thực đơn</b></Label></Col>
                                <Col md={3} xs={12}>
                                    <Button variant="primary" onClick={handleShow}>
                                        Chọn thực đơn
                                    </Button>

                                    <Modal show={show} onHide={handleClose}>
                                        <Modal.Header closeButton>
                                            <Modal.Title>Chọn thực đơn</Modal.Title>
                                        </Modal.Header>
                                        <Modal.Body>
                                            <Form>
                                                <Form.Group className="mb-3" controlId="formBasicEmail">
                                                    <Form.Label>Email address</Form.Label>
                                                    <Select
                                                        isMulti
                                                        isClearable
                                                        isSearchable
                                                        selected={lobbyId}
                                                        options={listLobby()}
                                                        onChange={(lobbyId1) => setLobbyId(lobbyId1.value)}
                                                    />
                                                </Form.Group>
                                                <Form.Group className="mb-3" controlId="formBasicCheckbox">
                                                    {/* <Form.Check
                                                        type="checkbox"
                                                        label="Check me out"
                                                    /> */}
                                                    {getFood.map(item => (
                                                        <label key={item.id}>
                                                        <Checkbox
                                                            name={item.name}
                                                            checked={checkedItems[item.name]}
                                                            onChange={handleChange}
                                                        />
                                                        {item.name}
                                                        </label>
                                                    ))}
                                                </Form.Group>
                                            </Form>
                                        </Modal.Body>
                                        <Modal.Footer>
                                            <Button variant="secondary" onClick={handleClose}>
                                                Đóng
                                            </Button>
                                            <Button variant="primary" onClick={handleClose}>
                                                OK
                                            </Button>
                                        </Modal.Footer>
                                    </Modal>
                                </Col>
                                <Col md={3} xs={12}><Label><b>Chọn đồ uống</b></Label></Col>
                                <Col md={3} xs={12}>
                                    <Button variant="primary" onClick={handleShow1}>
                                        Chọn đồ uống
                                    </Button>

                                    <Modal show={show1} onHide={handleClose1}>
                                        <Modal.Header closeButton>
                                            <Modal.Title>Chọn đồ uống</Modal.Title>
                                        </Modal.Header>
                                        <Modal.Body>Woohoo, you're reading this text in a modal!</Modal.Body>
                                        <Modal.Footer>
                                            <Button variant="secondary" onClick={handleClose1}>
                                                Đóng
                                            </Button>
                                            <Button variant="primary" onClick={handleClose1}>
                                                OK
                                            </Button>
                                        </Modal.Footer>
                                    </Modal>
                                </Col>
                            </Row>
                        </Form>
                    </Col>
                    <Col md={2}></Col>
                </Row>
            </div>
            <Footer/>
        </>
    )
}