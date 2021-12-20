import React, { useEffect, useState } from 'react'
import { Col, Form, Row, Button, Modal } from 'react-bootstrap'
import DatePicker from 'react-datepicker'
import { Input, Label } from 'reactstrap'
import cookies from 'react-cookies'
import "../css/BookParty.css"
import Footer from '../layout/Footer'
import HeaderSection from './HeaderSection'
import Select from 'react-select'
import "react-datepicker/dist/react-datepicker.css"
import API, { endpoints } from '../../configs/API'

const style = {
    marginTop: "2%"
}

const Checkbox = ({ type = "checkbox", checked = false, onChange, item }) => {
    // console.log("Checkbox: ", name, id, checked);
    return (
        <input type={type} name={item.name} checked={checked} onChange={() => {onChange(item)}} />
    );
  };

export default function BookParty () {
    const [startDate, setStartDate] = useState(new Date());
    const [tableQuantity, setTableQuantity] = useState(0);
    const [session, setSession] = useState(0);
    const [partyName, setPartyName] = useState("")
    const [getLobby, setGetLobby] = useState([])
    const [lobbyId, setLobbyId] = useState(0)
    const [eventType, setEventType] = useState(0)
    const [getFood, setGetFood] = useState([])
    const [getDrink, setGetDrink] = useState([])
    const [getService, setGetService] = useState([])
    const [getPaymentMethod, setGetPaymentMethod] = useState([])
    const [paymentId, setPaymentId] = useState(0)
    const [checkedFoods, setCheckedFoods] = useState([]);
    const [checkedDrinks, setCheckedDrinks] = useState([]);
    const [checkedServices, setCheckedServices] = useState([]);
    const [lobbyPrice, setLobbyPrice] = useState([]);
    const today = new Date()

    // Các hàm show modal
    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const [show1, setShow1] = useState(false);

    const handleClose1 = () => setShow1(false);
    const handleShow1 = () => setShow1(true);

    const [show2, setShow2] = useState(false);

    const handleClose2 = () => setShow2(false);
    const handleShow2 = () => {
        getServices();
        setShow2(true);
    }

    // Các option trong select box
    const options = [
        { value: 1, label: 'Buổi sáng' },
        { value: 2, label: 'Buổi trưa' },
        { value: 3, label: 'Buổi tối' }
    ]

    const options1 = [
        { value: 1, label: 'Tiệc cưới' },
        { value: 2, label: 'Hội nghị' },
        { value: 3, label: 'Sinh nhật' }
    ]

    // Đặt số lượng của từng đồ uống theo số lượng bàn
    const setQuantity = (unit, name) => {
        let quantity = 0;
        if(tableQuantity !== 0){
            switch(unit){
                case "thùng":
                    quantity = tableQuantity;
                    break;
                case "chai":
                    quantity = 2;
                    break;
                case "két":
                    quantity = tableQuantity;
                    break;
                default:
                    if(tableQuantity < 5)
                        quantity = 3;
                    else if(tableQuantity <= 20)
                        quantity = tableQuantity / 2;
                    else
                        quantity = 10;
                    break;
            }
        }
        else{
            quantity = 0;
        }
        return quantity;
    }

    // Lấy danh sách món ăn khách hàng lựa chọn
    const handleChangeFoods = (item) => {
        // kiểm tra có tồn tại trong mảng -> TH không
        if(checkedFoods.filter(d => d.id === item.id).length === 0) {
            setCheckedFoods([...checkedFoods, item]);
        } else {
            setCheckedFoods(checkedFoods.filter(d => d.id !== item.id));
        }
        console.log("checkedFoods: ", checkedFoods);
      };

    // Lấy danh sách đồ uống khách hàng lựa chọn
    const handleChangeDrinks = (item) => {
        // kiểm tra có tồn tại trong mảng -> TH không
        if(checkedDrinks.filter(d => d.id === item.id).length === 0) {
            let temp = {
                id: item.id,
                name: item.name,
                price: item.price,
                image: item.image,
                unit: item.unit,
                quantity: setQuantity(item.unit)
            }
            setCheckedDrinks([...checkedDrinks, temp]);
        } else {
            setCheckedDrinks(checkedDrinks.filter(d => d.id !== item.id));
        }
        console.log("checkedDrinks: ",checkedDrinks);
    };

    // Lấy danh sách dịch vụ khách hàng lựa chọn
    const handleChangeServices = (item) => {
        // kiểm tra có tồn tại trong mảng -> TH không
        if(checkedServices.filter(d => d.id === item.id).length === 0) {
            setCheckedServices([...checkedServices, item]);
        } else {
            setCheckedServices(checkedServices.filter(d => d.id !== item.id));
        }
        console.log("checkedServices: ", checkedServices);
    };

    // kiểm tra có nằm trong mảng checked hay không
    const compareToSetCheckedFood = (array, item) => {
        return array.filter(a => a.id === item.id).length !== 0;
    }

    const compareToSetCheckedDrink = (array, item) => {
        return array.filter(a => a.id === item.id).length !== 0;
    }

    const compareToSetCheckedService = (array, item) => {
        return array.filter(a => a.id === item.id).length !== 0;
    }

    useEffect(() => {
        // Lấy danh sách sảnh tiệc
        let getLobbies = async () => {
            try {
                let res = await API.get(`${endpoints['wedding_lobbies']}`)
                setGetLobby(res.data.results)
                console.log("lobby: ")
                console.log(res.data.results)
            }
            catch (err) {
                console.error(err)
            }
        }

        // Lấy danh sách món ăn
        let getFoods = async () => {
            try {
                let res = await API.get(`${endpoints['food_type']}`)
                setGetFood(res.data.results)
                console.log("getFood: ")
                console.log(res.data.results)
            }
            catch (err) {
                console.error(err)
            }
        }

        // Lấy danh sách đồ uống
        let getDrinks = async () => {
            try {
                let res = await API.get(`${endpoints['menu_drinks']}`)
                setGetDrink(res.data.results)
                console.log("getDrink: ")
                console.log(res.data.results)
            }
            catch (err) {
                console.error(err)
            }
        }

        // Lấy các lựa chọn thanh toán
        let getPaymentMethods = async () => {
            try {
                let res = await API.get(`${endpoints['payment_method']}`)
                setGetPaymentMethod(res.data.results)
                console.log("payment: ")
                console.log(res.data.results)
            }
            catch (err) {
                console.error(err)
            }
        }

        // Lấy danh sách giá của sảnh tiệc
        let getLobbyPrices = async () => {
            try {
                let res = await API.get(`${endpoints['wedding_lobby_price']}`)
                setLobbyPrice(res.data.results)
                console.log("lobbyPrice: ")
                console.log(res.data.results)
            }
            catch (err) {
                console.error(err)
            }
        }

        getLobbies()
        getFoods()
        getDrinks()
        getPaymentMethods()
        getLobbyPrices()
    }, [])

    console.log(lobbyPrice)

    // Lấy danh sách dịch vụ theo từng loại sự kiện
    let getServices = async () => {
        try {
            let res = await API.get(`${endpoints['wedding_event']}`);
            switch(eventType){
                case 1:
                    break;
                case 2:
                    res = await API.get(`${endpoints['conference_event']}`);
                    break;
                case 3:
                    res = await API.get(`${endpoints['birthday_event']}`);
                    break;
                default:
                    break;
            }
            setGetService(res.data.results)
        }
        catch (err) {
            console.error(err)
        }
    }

    // Lấy danh sách sảnh tiệc để hiển thị lên select box
    const listLobby = () => {
        let options1 = []
        for(let i = 0; i < getLobby.length; i++){
            options1.push({
                value: getLobby[i].id, label: getLobby[i].name
            });
        }
        return options1;
    }

    // Hiển thị danh sách món ăn lên check box modal
    const listFoods = (types) => {
        let foods = []
        for(let i = 0; i < types.menu_foods.length; i++){
            foods.push(types.menu_foods[i]);
        }
        let getItems = foods.map((item, index) => (
                            <>
                                <label name={item.name}>
                                    <Checkbox
                                        item={item}
                                        checked={compareToSetCheckedFood(checkedFoods, item)}
                                        onChange={handleChangeFoods}
                                    />
                                    &nbsp;&nbsp;{item.name}
                                </label>
                                <br/>
                            </>
                        ))
        return getItems;
    }

    // Kiểm tra xem button đủ điều kiện để disable hay isValid
    const checkedDisable = (name, onClick, x) => {
        if (x > 0){
            return  <Button variant="primary" onClick={onClick}>
                        {name}
                    </Button>
        }
        else {
            return  <Button variant="primary" onClick={onClick} disabled>
                        {name}
                    </Button>
        }
    }

    // Hiển thị danh sách đồ uống trên checkbox modal
    const listDrinks = (types) => {
        let drinks = []
        for(let i = 0; i < types.length; i++){
            drinks.push(types[i]);
        }
        let getItems1 = drinks.map((item, index) => (
                            <>
                                <label name={item.name}>
                                    {/* chọn thằng default là thằng đầu tiên, index là thứ tự object*/}
                                    <Row>
                                        <Col md={6} xs={6}>
                                            <Checkbox
                                                item={item}
                                                checked={compareToSetCheckedDrink(checkedDrinks, item)}
                                                onChange={handleChangeDrinks}
                                            />
                                            &nbsp;&nbsp;{item.name}
                                        </Col>
                                        <Col md={6} xs={6}>
                                            <Row>
                                                <Col md={8} xs={6}>
                                                    <Input type="number" id={item.id} value={setQuantity(item.unit)} defaultValue={0} min={0} disabled/>
                                                </Col>
                                                <Col md={4} xs={6}>
                                                    {item.unit}
                                                </Col>
                                            </Row>
                                        </Col>
                                    </Row>
                                </label>
                                <br/>
                            </>
                        ))
        return getItems1;
    }

    // Hiển thị danh sách dịch vụ lên checkbox modal
    const listServices = (types) => {
        let services = []
        for(let i = 0; i < types.services.length; i++){
            services.push(types.services[i]);
        }
        let getItems2 = services.map((item, index) => (
                            <>
                                <label name={item.name}>
                                    <Checkbox
                                        item={item}
                                        checked={compareToSetCheckedService(checkedServices, item)}
                                        onChange={handleChangeServices}
                                    />
                                    &nbsp;&nbsp;{item.name}
                                </label>
                                <br/>
                            </>
                        ))
        return getItems2;
    }

    // Kiểm tra có phải cuối tuần hay không
    const checkedWeekend = (date) => {
        if(date.getDay() === 0 || date.getDay() === 6) {
            return true;
        }
        else {
            return false;
        }
    }

    // Tính tổng tiền
    const total = () => {
        let totalPrice = 0;
        if(tableQuantity > 0){
            for(let i = 0; i < checkedFoods.length; i++){
                totalPrice += checkedFoods[i].price * tableQuantity;
            }
            for(let i = 0; i < checkedDrinks.length; i++){
                totalPrice += checkedDrinks[i].price * checkedDrinks[i].quantity;
            }
            for(let i = 0; i < checkedServices.length; i++){
                totalPrice += checkedServices[i].price;
            }
        }
        return totalPrice;
    }

    // Đặt tiệc
    const bookParty = (event) => {
        event.preventDefault();
        if(tableQuantity > 0) {
            let price = lobbyPrice.filter(p => p.wedding_lobby === lobbyId && p.time === session && p.is_weekend === checkedWeekend(startDate))[0].price;
            let bill = total() + price;
            console.log("total: " + total())
            console.log("price: " + price)
            console.log("bill: " + bill)

            let party = async () => {
                let foods = []
                let food = {}
                for (let i = 0; i < checkedFoods.length; i++){
                    food = {
                        unit_price: checkedFoods[i].price,
                        menu_food: checkedFoods[i].id,
                        // invoice: invoiceId
                    }
                    console.info("food")
                    foods.push(food);
                }

                let drinks = []
                let drink = {}
                for (let i = 0; i < checkedDrinks.length; i++){
                    drink = {
                        unit_price: checkedDrinks[i].price,
                        quantity: checkedDrinks[i].quantity,
                        unit: checkedDrinks[i].unit,
                        menu_drink: checkedDrinks[i].id
                    }
                    console.info("drink")
                    drinks.push(drink);
                }

                let services = []
                let service = {}
                for (let i = 0; i < checkedServices.length; i++){
                    service = {
                        unit_price: checkedServices[i].price,
                        service: checkedServices[i].id
                    }
                    console.info("service")
                    services.push(service);
                }

                try {
                    let res = await API.post(endpoints['book_party'], {
                        "party_name": partyName,
                        "table_quantity": tableQuantity,
                        "rental_date": startDate,
                        "lobby_price": price,
                        "session": session,
                        "totalBill": bill,
                        "wedding_lobby": lobbyId,
                        "payment_method": paymentId,
                        "foods": foods,
                        "drinks": drinks,
                        "services": services
                    }, {
                        headers: {
                            "Authorization": `Bearer ${cookies.load("access_token")}`
                        }
                    })
                    console.info(res.data)
                    window.alert("Chúc mừng, bạn đã đặt tiệc thành công!")
                } catch (err) {
                    console.error(err)
                    window.alert("Đặt tiệc thất bại! Vui lòng kiểm tra lại.")
                }
            }
            party()
        }
        else{
            window.alert("Đặt tiệc thất bại! Bạn chưa chọn số bàn.")
        }
    }

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
                    <Col md={8} >
                        <Form onSubmit={bookParty}>
                            <div className="card-party">
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
                                        {checkedDisable("Chọn thực đơn", handleShow, tableQuantity)}

                                        <Modal size="lg" show={show} onHide={handleClose} aria-labelledby="example-modal-sizes-title-lg">
                                            <Modal.Header closeButton>
                                                <Modal.Title id="example-modal-sizes-title-lg" style={{color: "#3104B4"}}>Chọn thực đơn</Modal.Title>
                                            </Modal.Header>
                                            <Modal.Body>
                                                <Form>
                                                    <Form.Group className="mb-3" controlId="formBasicCheckbox">
                                                        <Row>
                                                            {getFood.map(item => (
                                                                <Col md={4} xs={12} style={style}>
                                                                    <h5 style={{color: "#3104B4"}}>{item.name}</h5>
                                                                    <div>{listFoods(item)}</div>
                                                                </Col>
                                                            ))}
                                                        </Row>
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
                                        {checkedDisable("Chọn đồ uống", handleShow1, tableQuantity)}

                                        <Modal show={show1} onHide={handleClose1}>
                                            <Modal.Header closeButton>
                                                <Modal.Title style={{color: "#3104B4"}}>Chọn đồ uống</Modal.Title>
                                            </Modal.Header>
                                            <Modal.Body>
                                                <Form>
                                                    <Form.Group className="mb-3" controlId="formBasicCheckbox">
                                                        <h5 style={{color: "#3104B4"}}>{getDrink.name}</h5>
                                                        <div>{listDrinks(getDrink)}</div>
                                                    </Form.Group>
                                                </Form>
                                            </Modal.Body>
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
                                <Row style={style}>
                                    <Col md={3} xs={12}><Label><b>Loại sự kiện</b></Label></Col>
                                    <Col md={3} xs={12}>
                                        <Select
                                            selected={eventType}
                                            options={options1}
                                            onChange={(type) => setEventType(type.value)}
                                        />
                                    </Col>
                                    <Col md={3} xs={12}><Label><b>Chọn dịch vụ</b></Label></Col>
                                    <Col md={3} xs={12}>
                                        {checkedDisable("Chọn dịch vụ", handleShow2, eventType)}

                                        <Modal size="lg" show={show2} onHide={handleClose2} aria-labelledby="example-modal-sizes-title-lg">
                                            <Modal.Header closeButton>
                                                <Modal.Title id="example-modal-sizes-title-lg" style={{color: "#3104B4"}}>Chọn dịch vụ</Modal.Title>
                                            </Modal.Header>
                                            <Modal.Body>
                                                <Form>
                                                    <Form.Group className="mb-3" controlId="formBasicCheckbox">
                                                        <Row>
                                                            {getService.map(item => (
                                                                <Col md={4} xs={12} style={style}>
                                                                    <h5 style={{color: "#3104B4"}}>{item.name}</h5>
                                                                    <div>{listServices(item)}</div>
                                                                </Col>
                                                            ))}
                                                        </Row>
                                                    </Form.Group>
                                                </Form>
                                            </Modal.Body>
                                            <Modal.Footer>
                                                <Button variant="secondary" onClick={handleClose2}>
                                                    Đóng
                                                </Button>
                                                <Button variant="primary" onClick={handleClose2}>
                                                    OK
                                                </Button>
                                            </Modal.Footer>
                                        </Modal>
                                    </Col>
                                </Row>
                                <Row style={style}>
                                    <Col md={3} xs={12}><Label><b>Tổng tiền</b></Label></Col>
                                    <Col md={9} xs={12}>
                                        {(lobbyId > 0 && session > 0) ? (total() + lobbyPrice.filter(p => p.wedding_lobby === lobbyId && p.time === session && p.is_weekend === checkedWeekend(startDate))[0].price) : 0} VNĐ
                                    </Col>
                                </Row>
                                <Row style={style}>
                                    <Col md={3} xs={12}><Label><b>Chọn phương thức thanh toán</b></Label></Col>
                                    <Col md={9} xs={12}>
                                        {getPaymentMethod.length !== 0 && getPaymentMethod.map(p => (
                                            <>
                                                <Form.Check
                                                    inline
                                                    label={p.name}
                                                    name="group1"
                                                    type="radio"
                                                    id={`inline-radio-${p.id}`}
                                                    onChange={() => setPaymentId(p.id)}
                                                />
                                            </>
                                        ))}
                                    </Col>
                                </Row>
                            </div>
                            <div style={{marginTop: "3%", textAlign: "center"}}>
                                <Button type="submit" variant="danger" size="lg">ĐẶT TIỆC</Button>
                            </div>
                        </Form>
                    </Col>
                    <Col md={2}></Col>
                </Row>
            </div>
            <Footer/>
        </>
    )
}
