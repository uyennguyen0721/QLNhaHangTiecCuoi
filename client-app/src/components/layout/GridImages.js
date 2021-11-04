import React from 'react';
import GridImageItem from '../layout/GridImageItem';
import '../css/GridImages.css'

export default function GridImages () {
    return (
        <>
            <div className="grid-item row">
                <GridImageItem
                    src="/images/wedding.jpg"
                    title="TIỆC CƯỚI"
                    text="Với những thuận lợi về mặt địa điểm cùng với diện tích sảnh tiệc rộng lớn, phong cách phục vụ chuyên nghiệp cũng như các gói dịch vụ cưới đa dạng, Glorian tự hào là một trong những địa điểm tổ chức tiệc cưới lý tưởng hàng đầu tại khu vực TP.HCM."
                />
                <GridImageItem
                    src="/images/conference.jpg"
                    title="HỘI NGHỊ"
                    text="Được đánh giá là một trong những trung tâm hội nghị có sức phục vụ lớn nhất thành phố Hồ Chí Minh, Glorian có thể đáp ứng cho những đại tiệc hội nghị lên đến 2.500 khách. Bên cạnh không gian tiệc rộng lớn Glorian còn có thể đáp ứng tốt nhất về các trang thiết bị hiện đại với hệ thống đèn chiếu sáng linh hoạt, hệ thống vách ngăn và sân khấu di động, internet không dây … mang đến sự thuận lợi cao nhất cho khách hàng"
                />
                {/* <GridImageItem
                    src="/images/birthday.jpg"
                    title="SINH NHẬT"
                    text="Với lối trang trí sảnh tiệc đa dạng, diện tích sảnh lớn, phù hợp trong việc nhiều loại sự kiện, Glorian có thể đáp ứng cho những buổi tiệc sinh nhật nhỏ và lớn đáp ứng nhu cầu của khách hàng."
                /> */}
            </div>
        </>
    )
}