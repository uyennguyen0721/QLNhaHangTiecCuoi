import React from 'react'
import HeaderSection from "./HeaderSection"
import Footer from "../layout/Footer"
import '../css/WeddingService.css'

export default function ConferenceService () {
    return (
        <>
            <HeaderSection
                src="/images/conference-service-bg.jpg"
                name="Dịch vụ hội nghị"
            />
            <div className="wedding-service">
                <p><b>Tại Trung Tâm Hội Nghị - Tiệc Cưới Glorian, chúng tôi cung cấp các gói họp hội nghị tiêu chuẩn nửa ngày và nguyên ngày cao cấp với mức giá linh hoạt cho doanh nghiệp. Dựa trên quy mô và tính chất của hội nghị, các chuyên gia sẽ tư vấn, thiết kế phương án sắp xếp tối ưu. Đặc biệt, chúng tôi sẽ luôn đồng hành, hỗ trợ khách hàng và đối tác trong suốt quá trình tổ chức, đảm bảo sự kiện diễn ra suôn sẻ, chỉn chu trong từng chi tiết.</b></p>
            </div>
            <Footer/>
        </>
    )
}