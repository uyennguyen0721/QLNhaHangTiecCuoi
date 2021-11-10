import React, { useEffect, useState } from 'react'
import HeaderSection from "./HeaderSection"
import Footer from "../layout/Footer"
import API, { endpoints } from '../../configs/API';
import { useParams } from 'react-router';
import { Spinner } from 'react-bootstrap';
import CardItem from '../layout/CardItem';

export default function ServiceDetail () {

    let { serviceId } = useParams()
    const [service, setService] = useState([])

    useEffect(() => {
        async function fetchAPI () {
            let res = await API.get(endpoints['services'](serviceId))
            setService(res.data)
        }
        fetchAPI()
    })

    if(service === null || service === undefined){
        return <Spinner animation="border"/>
    }

    return (
        <>
            <HeaderSection
                src="/images/service-detail-bg.jpg"
                name="Dịch vụ"
            />
            <div className='cards'>
                <h1>Các dịch vụ</h1>
                <div className='cards__container'>
                    <div className='cards__wrapper'>
                        <div className='cards__items row'>
                            {
                                service.length!==0 && service.map(f =>
                                    <CardItem
                                        src={f.image}
                                        text={f.name}
                                        path= {`/service-type/${f.service_type}/services`}
                                        price={f.price}
                                        unit='tiệc'
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