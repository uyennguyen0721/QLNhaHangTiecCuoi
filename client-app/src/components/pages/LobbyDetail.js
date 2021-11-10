import React, { useState, useEffect } from 'react';
import '../../App.css';
import '../css/Lobbies.css'
import Footer from '../layout/Footer';
import HeaderSection from './HeaderSection';
import { useParams } from 'react-router-dom';
import API, { endpoints } from '../../configs/API'
import { Spinner } from 'react-bootstrap';

export default function Lobbies() {

  let { lobbyId } = useParams()
  let [ lobbies, setLobbies] = useState([])

  useEffect(() => {
    async function fetchAPI () {
      let res = await API.get(endpoints['wedding_lobbies-detail'](lobbyId))
      setLobbies(res.data)
    }
    fetchAPI()
  })

  if(lobbies === null || lobbies === undefined){
      return <Spinner animation="border"/>
  }


  const listPrices = () => {
    if (lobbies?.wedding_lobby_prices?.length) {
        return lobbies.wedding_lobby_prices.map((p, index) => p.is_weekend === false ? (
                <div key={index}>
                    {p.time === 1 && <div>Buổi sáng: {p.price} VNĐ</div>}
                    {p.time === 2 && <div>Buổi trưa: {p.price} VNĐ</div>}
                    {p.time === 3 && <div>Buổi tối: {p.price} VNĐ</div>}
                </div>
            ) : null
        );
    }
    return null
  }

  const listPrices1 = () => {
    if (lobbies?.wedding_lobby_prices?.length) {
        return lobbies.wedding_lobby_prices.map((p, index) => p.is_weekend === true ? (
                <div key={index}>
                    {p.time === 1 && <div>Buổi sáng: {p.price} VNĐ</div>}
                    {p.time === 2 && <div>Buổi trưa: {p.price} VNĐ</div>}
                    {p.time === 3 && <div>Buổi tối: {p.price} VNĐ</div>}
                </div>
            ) : null
        );
    }
    return null
  }

  return (
    <>
      <HeaderSection
          src="/images/lobbies-bg.jpg"
          name="Sảnh tiệc"
      />
      <div className="lobby-body">
            <div className="lobby-info">
                <h1 className="lobby-title">{lobbies.name}</h1>
                <p className="lobby-description">{lobbies.description}</p>
                <p className="lobby-details">{lobbies.name} nằm ở lầu {lobbies.location} của Trung tâm Hội nghị - Tiệc cưới Glorian, có sức chứa lên đến {lobbies.capacity}</p>
            </div>
            <div className="lobby-category">
                <div className="row">
                    <div className="col-md-4 col-xs-12">
                        <h4 style={{color: "#3104B4", fontFamily: "'Nunito', sans-serif"}}>Đơn giá thuê sảnh</h4>
                        <div>
                            <ul>
                                <li style={{marginLeft: "5%", marginTop: "3%"}}>
                                    <b>Ngày thường:</b>
                                    <div style={{marginLeft: "10%"}}>{listPrices()}</div>
                                </li>
                                <li style={{marginLeft: "5%", marginTop: "3%"}}>
                                    <b>Cuối tuần:</b>
                                    <div style={{marginLeft: "10%"}}>{listPrices1()}</div>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <div className="col-md-8 col-xs-12">
                        <img src={lobbies.image} alt="ảnh minh họa"></img>
                    </div>
                </div>
            </div>
        </div>
      <Footer/>
    </>
  )
}