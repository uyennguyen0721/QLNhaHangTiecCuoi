import React, { useState, useEffect } from 'react';
import '../../App.css';
import '../Lobbies.css'
import Footer from '../Footer';
import HeaderSection from '../HeaderSection';
import { useParams } from 'react-router';
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
                        <h3>Đơn giá thuê sảnh</h3>
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