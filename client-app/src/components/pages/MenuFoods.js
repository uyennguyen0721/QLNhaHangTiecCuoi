import { useEffect, useState } from "react"
import { Button, ButtonGroup, Spinner } from "react-bootstrap"
import { useLocation } from "react-router"
import API, { endpoints } from "../../configs/API"
import CardItem from "../layout/CardItem"
import Footer from "../layout/Footer"
import HeaderSection from "./HeaderSection"

export default function MenuFoods() {
    const [foods, setFoods] = useState([])
    const [prev, setPrev] = useState(false)
    const [next, setNext] = useState(false)
    const [page, setPage] = useState(1)
    const location = useLocation()

    useEffect(() => {
        let loadFoods = async () => {
            let query = location.search
            if (query === "")
                query = `?page=${page}`
            else
                query += `&page=${page}`
            try {
                let res = await API.get(`${endpoints['menu_foods']}${query}`)

                setFoods(res.data.results)

                setNext(res.data.next !== null)
                setPrev(res.data.previous !== null)
            }
            catch (err) {
                console.error(err)
            }
        }

        loadFoods()
    }, [location.search, page])

    const paging = (inc) => {
        setPage(page + inc)
    }

    if(foods === null || foods === undefined){
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
                    <div className="cards__wrapper">
                        <div className="cards__items row">
                            {
                                foods.length!==0 && foods.map(f =>
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

                <div className="container" style={{display: "flex", justifyContent: "center"}}>
                    <ButtonGroup>
                        <Button variant="info" onClick={() => paging(-1)} disabled={!prev}>&lt;&lt;</Button>
                        <Button variant="info" onClick={() => paging(1)} disabled={!next}>&gt;&gt;</Button>
                    </ButtonGroup>
                </div>

            </div>
            <Footer />
        </>
    )
}