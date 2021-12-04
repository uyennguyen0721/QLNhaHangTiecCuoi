import React, { useState, useEffect } from 'react';
import '../../App.css';
import '../css/Lobbies.css'
import { Button } from "../layout/Button";
import Footer from '../layout/Footer';
import HeaderSection from './HeaderSection';
import API, { endpoints } from '../../configs/API'
import { useLocation } from 'react-router';

export default function Lobbies() {

    const [lobby, setLobby] = useState([])
    const locations = useLocation()

    useEffect(() => {
        let loadLobbies = async () => {
            let query1 = locations.search
            try {
                let res = await API.get(`${endpoints['wedding_lobbies']}${query1}`)

                setLobby(res.data.results)
            }
            catch (err) {
                console.error(err)
            }
        }

        loadLobbies()

    }, [locations.search])

  return (
    <>
      <HeaderSection
          src="/images/lobbies-bg.jpg"
          name="Sảnh tiệc"
      />
      <div className="lobby-body">
            <div className="lobby-info">
                <h1 className="lobby-title">Sảnh tiệc</h1>
                <p className="lobby-description">GLORIAN - Không chỉ nổi tiếng với những không gian sảnh cưới riêng biệt, mà ở đây bạn còn có thể thoải mái lựa chọn màu sảnh theo tông màu yêu thích. Mỗi màu sắc không chỉ làm cho đám cưới của bạn rực rỡ và sống động hơn mà còn mang những ý nghĩa rất riêng cho ngày trọng đại.</p>
                <p className="lobby-details">Tại Glorian, mỗi sảnh tiệc mang những gam màu chủ đạo khác nhau - sảnh Tulip với màu vàng sang trọng, sảnh Rose với màu đỏ ấn tượng, sảnh Violet với sắc tím lãng mạn và sảnh Glorian với màu xanh tươi mới. Hãy cùng khám phá 4 sảnh tiệc cưới sang trọng làm nên thương hiệu Glorian để bạn có thể lựa chọn cho mình được sảnh cưới thật đẹp và ý nghĩa nhé!</p>
            </div>
            <div className="lobby-category">
                <div className="row">
                    <div className="col-md-4 col-xs-12">
                    {
                      lobby.length!==0 && lobby.map(l =>
                          <div className="lobby-menu row">
                              <Button
                                  className='btns'
                                  buttonStyle='btn--secondary'
                                  buttonSize='btn--medium--secondary'
                                  to={`/lobbies/${l.id}`}
                                  key={l.id}
                              >
                                  {l.name}
                              </Button>
                          </div>
                        )
                    }
                    </div>
                    <div className="col-md-8 col-xs-12">
                        <img src="/images/lobby-img.jpg" alt="ảnh minh họa"></img>
                    </div>
                </div>
            </div>
        </div>
      <Footer/>
    </>
  )
}