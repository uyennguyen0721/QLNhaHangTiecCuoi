import React, { useEffect, useState } from 'react'
import HeaderSection from "./HeaderSection"
import Footer from "../layout/Footer"
import '../css/WeddingService.css'
import API, { endpoints } from '../../configs/API';
import { Button } from '../layout/Button';
import Slideshow from '../SlideShow/Slideshow';

const collection = [
    { src: "/images/slideshow/slide-1.jpg", caption: "Trang trí cổng sinh nhật" },
    { src: "/images/slideshow/slide-2.jpg", caption: "Trang trí cổng sinh nhật" },
    { src: "/images/slideshow/slide-3.jpg", caption: "Bàn lễ tân" },
    { src: "/images/slideshow/slide-4.jpg", caption: "Trang trí tiệc sinh nhật" },
    { src: "/images/slideshow/slide-5.jpg", caption: "Bàn lễ tân" },
    { src: "/images/slideshow/slide-6.jpg", caption: "Tiệc sinh nhật" },
  ];

export default function BirthdayService () {

    const [birthdayServiceType, setBirthdayServiceType] = useState([])

    useEffect(() => {
        async function fetchAPI () {
            let res = await API.get(endpoints['birthday_event'])
            setBirthdayServiceType(res.data.results)
        }
        fetchAPI()
    })

    return (
        <>
            <HeaderSection
                src="/images/birthday-service-bg.jpg"
                name="Dịch vụ sinh nhật"
            />
            <div className="wedding-service">
                <p><b>Tại Trung Tâm Hội Nghị - Tiệc Cưới Glorian, chúng tôi cung cấp dịch vụ tiệc sinh nhật trọn gói với các chủ đề linh hoạt và phù hợp với yêu cầu của khách hàng và chủ nhân của buổi tiệc. Tất cả hạng mục, từ hoa bàn tiệc, bánh sinh nhật đến khu vực chụp hình, bàn đón khách, bàn lễ tân đều được các chuyên gia của chúng tôi chăm chút chỉn chu, tỉ mỉ đến từng chi tiết, để bạn có thể toàn tâm tận hưởng những phút giây hạnh phúc trong ngày sinh nhật.</b></p>
            </div>
            <div className="row" style={{marginLeft: "5%", marginRight: "5%"}}>
                <div className="col-md-6 col-xs-12">
                    <p>Tiệc sinh nhật là dịp để tổ chức một bữa tiệc đáng nhớ nhất của mỗi người khi đây là cột mốc đánh dấu thêm tuổi mới. Tổ chức một bữa tiệc sinh nhật vui vẻ, ấn tượng sẽ là món quà ngọt ngào thay cho lời chúc mừng đến những người mà bạn quan tâm. Để kỷ niệm một ngày có ý nghĩa đặc biệt quan trọng như thế, bạn luôn mong muốn đem lại những giây phút khó quên và ý nghĩa nhất cho những người yêu thương ấy.</p>
                    <p>Hiểu được những mong muốn, tâm tư đó, trung tâm Hội nghị - Tiệc Cưới Glorian luôn cố gắng và nỗ lực không ngừng để mang đến những buổi tiệc sinh nhật lãng mạn và ấn tượng với những gam màu, những sắc thái riêng biệt. Glorian – Tự hào là Địa điểm tổ chức sinh nhật trọn gói chuyên nghiệp và lý tưởng nhất!</p>
                    <div className="row">
                        {
                            birthdayServiceType.length!==0 && birthdayServiceType.map (f =>
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
                <div className="col-md-6 col-xs-12">
                    <Slideshow
                        input={collection}
                        ratio={`3:2`}
                        mode={`automatic`}
                        timeout={`3000`}
                    />
                </div>
            </div>
            <div style={{margin: "2% 5% 5% 5%"}}>
                <h3>Một số hình ảnh</h3>
                <div className="row">
                    <div className="col-md-6 col-xs-12">
                        <img src="/images/birthday-1.jpg" alt="" width="100%"/>
                    </div>
                    <div className="col-md-6 col-xs-12">
                        <img src="/images/birthday-2.jpg" alt="" width="100%"/>
                    </div>
                </div>
            </div>
            <Footer/>
        </>
    )
}