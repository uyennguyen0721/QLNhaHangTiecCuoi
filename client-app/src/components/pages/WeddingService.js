import React, { useEffect, useState } from 'react';
import HeaderSection from "./HeaderSection"
import Slideshow from "../SlideShow/Slideshow"
import Footer from "../layout/Footer"
import { Button } from "../layout/Button";
import '../css/WeddingService.css'
import API, { endpoints } from '../../configs/API';

const collection = [
  { src: "/images/slideshow/slide1.jpg", caption: "Trang trí sảnh tiệc" },
  { src: "/images/slideshow/slide2.jpg", caption: "Trang trí lối đi" },
  { src: "/images/slideshow/slide3.jpg", caption: "Trang trí cổng hoa" },
  { src: "/images/slideshow/slide4.jpg", caption: "Bàn lễ tân" },
  { src: "/images/slideshow/slide5.jpg", caption: "Văn nghệ khai tiệc" },
  { src: "/images/slideshow/slide6.jpg", caption: "Nghi thức lễ cưới" },
];
export default function WeddingService () {

    const [weddingServiceType, setWeddingServiceType] = useState([])

    useEffect(() => {
        async function fetchAPI () {
            let res = await API.get(endpoints['wedding_event'])
            setWeddingServiceType(res.data.results)
        }
        fetchAPI()
    })

    return (
        <>
            <HeaderSection
                src="/images/wedding-service-bg.jpg"
                name="Dịch vụ tiệc cưới"
            />
            <div className="wedding-service">
                <p><b>Tại Trung Tâm Hội Nghị - Tiệc Cưới Glorian, chúng tôi cung cấp dịch vụ tiệc cưới trọn gói với các chủ đề sang trọng, trang nhã, phù hợp với từng không gian sảnh tiệc. Tất cả hạng mục, từ hoa bàn tiệc, bánh cưới đến khu vực chụp hình, bàn đón khách, lễ tân, khánh tiết đều được các chuyên gia của chúng tôi chăm chút chỉn chu, tỉ mỉ đến từng chi tiết, để bạn có thể toàn tâm tận hưởng những phút giây hạnh phúc trong ngày trọng đại.</b></p>
            </div>
            <div className="row" style={{marginLeft: "5%", marginRight: "5%"}}>
                <div className="col-md-6 col-xs-12">
                    <Slideshow
                        input={collection}
                        ratio={`3:2`}
                        mode={`automatic`}
                        timeout={`3000`}
                    />
                </div>
                <div className="col-md-6 col-xs-12">
                    <p>Với đội ngũ chuyên gia hơn 12 năm kinh nghiệm trong lĩnh vực tổ chức tiệc cưới, chúng tôi sẽ đồng hành cùng bạn trong suốt quá trình hiện thực hóa giấc mơ cổ tích mà bạn hằng ấp ủ. Từ giai đoạn lập kế hoạch tổ chức, lựa chọn thực đơn, trang trí sảnh tiệc, đến chương trình biểu diễn. Tất cả mọi chi tiết đều được chúng tôi sắp đặt chỉn chu, hoàn mỹ. Hãy để chúng tôi giúp bạn biến  ngày cưới trở thành một hồi ức đẹp nhất cuộc đời !</p>
                    <div className="row" style={{marginLeft: "5%"}}>
                        {
                            weddingServiceType.length!==0 && weddingServiceType.map (f =>
                                <div className="col-md-6 col-xs-12" style={{marginBottom: "5%"}}>
                                    <Button
                                        className='btns'
                                        buttonStyle='btn--secondary'
                                        buttonSize='btn--medium--secondary'
                                        to={`/service-type/${f.id}/services/`}
                                        key={f.id}
                                    >
                                        {f.name}
                                    </Button>
                                </div>
                            )
                        }
                    </div>
                </div>
            </div>
            <div style={{margin: "2% 5% 5% 5%"}}>
                <h3>Một số hình ảnh</h3>
                <div className="row">
                    <div className="col-md-6 col-xs-12">
                        <img src="/images/wedding-1.jpg" alt="" width="100%"/>
                    </div>
                    <div className="col-md-6 col-xs-12">
                        <img src="/images/wedding-2.jpg" alt="" width="100%"/>
                    </div>
                </div>
            </div>
            <Footer/>
        </>
    )
}