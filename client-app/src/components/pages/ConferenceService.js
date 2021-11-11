import React, { useEffect, useState } from 'react'
import HeaderSection from "./HeaderSection"
import Footer from "../layout/Footer"
import '../css/WeddingService.css'
import API, { endpoints } from '../../configs/API';
import { Button } from '../layout/Button';


export default function ConferenceService () {

    const [conferenceServiceType, setConferenceServiceType] = useState([])

    useEffect(() => {
        async function fetchAPI () {
            let res = await API.get(endpoints['conference_event'])
            setConferenceServiceType(res.data.results)
        }
        fetchAPI()
    }, [])

    return (
        <>
            <HeaderSection
                src="/images/conference-service-bg.jpg"
                name="Dịch vụ hội nghị"
            />
            <div className="wedding-service">
                <p><b>Tại Trung Tâm Hội Nghị - Tiệc Cưới Glorian, chúng tôi cung cấp các gói họp hội nghị tiêu chuẩn nửa ngày và nguyên ngày cao cấp với mức giá linh hoạt cho doanh nghiệp. Dựa trên quy mô và tính chất của hội nghị, các chuyên gia sẽ tư vấn, thiết kế phương án sắp xếp tối ưu. Đặc biệt, chúng tôi sẽ luôn đồng hành, hỗ trợ khách hàng và đối tác trong suốt quá trình tổ chức, đảm bảo sự kiện diễn ra suôn sẻ, chỉn chu trong từng chi tiết.</b></p>
            </div>
            <div>
                <div className="row" style={{margin: "0 5% 2% 5%"}}>
                    <div className="col-md-6 col-xs-12">
                        <p>Đối với các doanh nghiệp, việc lựa chọn địa điểm tổ chức sự kiện không chỉ dừng lại ở vị trí mà còn cần lựa chọn thương hiệu thể hiện được sự chuyên nghiệp và chu đáo trong việc phục vụ sự kiện. Việc lựa chọn địa điểm tổ chức Sự kiện - Hội nghị cũng chính là khẳng định danh tiếng và uy tín của doanh nghiệp.</p>
                        <p>Trung Tâm Hội Nghị - Tiệc Cưới Glorian với phong cách kiến trúc Châu Âu sang trọng, theo tiêu chuẩn 5 sao, không gian linh hoạt và sức chứa rộng lớn, đa dạng, phù hợp cho nhiều loại hình sự kiện. Glorian sẵn sàng giúp quý doanh nghiệp có được những sự kiện như ý gây ấn tượng tốt đẹp với các đối tác, khách hàng với ngân sách linh hoạt.</p>
                        <div className="row">
                            {
                                conferenceServiceType.length!==0 && conferenceServiceType.map (f =>
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
                        <img src="/images/conference-services.jpg" alt="" width="100%"/>
                    </div>
                </div>
            </div>
            <div style={{margin: "2% 5% 5% 5%"}}>
                <h3>Một số hình ảnh</h3>
                <div className="row">
                    <div className="col-md-6 col-xs-12">
                        <img src="/images/conference-1.jpg" alt="" width="100%"/>
                    </div>
                    <div className="col-md-6 col-xs-12">
                        <img src="/images/conference-2.jpg" alt="" width="100%"/>
                    </div>
                </div>
                <div className="row" style={{marginTop: "2%"}}>
                    <div className="col-md-6 col-xs-12">
                        <img src="/images/conference-3.jpg" alt="" width="100%"/>
                    </div>
                    <div className="col-md-6 col-xs-12">
                        <img src="/images/conference-4.jpg" alt="" width="100%"/>
                    </div>
                </div>
            </div>
            <Footer/>
        </>
    )
}