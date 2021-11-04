import React from 'react';
import HeaderSection from "./HeaderSection";
import '../../App.css';
import CardProcedure from '../layout/CardProcedure';
import Footer from '../layout/Footer';

const style = {
  fontFamily: "'Nunito', sans-serif",
  color: "#3104B4"
}

export default function Services() {

  return (
    <>
      <HeaderSection
          src="/images/service-bg.jpg"
          name="Dịch vụ"
      />
      <div className="container" style={{margin: "15% 5% 5% 5%"}}>
        <div className="row" style={{marginBottom: "5%"}}>
          <div className="col-md-5 col-xs-12">
              <CardProcedure
                img="/images/wedding-service.jpg"
                title="Tiệc cưới"
                text="Bên cạnh những sảnh tiệc sang trọng , thiết bị và nội thất tinh tế hiện đại, Glorian còn gửi đến quý khách hàng những dịch vụ cao cấp nhằm mục đích mang đến sự hoàn hảo và ấn tượng đặc biệt cho ngày trọng đại của bạn."
                link="/wedding-service"
                name="Xem dịch vụ"
              />
          </div>
          <div className="col-md-7 col-xs-12" style={{marginTop: "2%", fontFamily: "'Nunito', sans-serif"}}>
              <h1 style={style}>Dịch vụ cho tiệc cưới</h1>
              Glorian cùng đội ngũ nhân viên chuyên nghiệp và dịch vụ đa dạng sẽ đem đến sự hài lòng và trở thành địa điểm tổ chức tiệc cưới hoàn hảo cho các cặp đôi. Trong đó nghi thức tiệc cưới luôn được Glorian chú trọng. Giây phút cửa sảnh đường rộng mở, hai bạn tay trong tay cùng nhau tiến lên lễ đài ắt hẳn sẽ để lại một ấn tượng sâu sắc trong lòng quan khách. Thêm vào đó, trong không gian lộng lẫy, những nghi lễ truyền thống mang nét đẹp của văn hóa dân tộc sẽ được cử hành trang trọng tại Glorian. Dưới sự dẫn dắt chuyên nghiệp và tràn đầy tự tin của đội ngũ dẫn chương trình hòa cùng tiếng nhạc và những tràn pháo tay, tiếng pháo chúc mừng và những lời chúc ngọt ngào, chúng tôi tin rằng giây phút hai bạn nguyện thề mãi có nhau sẽ thêm thăng hoa hạnh phúc.
          </div>
        </div>
        <div className="row" style={{marginBottom: "5%"}}>
          <div className="col-md-7 col-xs-12" style={{marginTop: "2%", fontFamily: "'Nunito', sans-serif"}}>
              <h1 style={style}>Dịch vụ cho hội nghị</h1>
              Được đánh giá là một trong những trung tâm hội nghị có sức phục vụ lớn nhất thành phố Hồ Chí Minh, Glorian có thể đáp ứng cho những đại tiệc hội nghị lên đến 2.500 khách, Bên cạnh không gian tiệc rộng lớn Glorian còn có thể đáp ứng tốt nhất về các trang thiết bị hiện đại với hệ thống đèn chiếu sáng linh hoạt, hệ thống vách ngăn và sân khấu di động, internet không dây, không gian trang trí bắt mắt và lộng lẫy … mang đến sự thuận lợi cao nhất, phù hợp với từng chủ đề và ý tưởng của khách hàng, của buổi tiệc hội nghị giúp cho buổi tiệc hội nghị được thành công tốt đẹp.
          </div>
          <div className="col-md-5 col-xs-12">
              <CardProcedure
                img="/images/conference-service.jpg"
                title="Hội nghị"
                text="Bên cạnh những dịch vụ tiêu chuẩn phục vụ cho tiệc hội nghị, Glorian còn cung cấp đến quý khách hàng các dịch vụ kèm thêm ngoại chuẩn nhằm đáp ứng mọi yêu cầu và mang đến thành công cho hội nghị."
                link="/conference-service"
                name="Xem dịch vụ"
              />
          </div>
        </div>
        <div className="row" style={{marginBottom: "5%"}}>
          <div className="col-md-5 col-xs-12">
              <CardProcedure
                img="/images/birthday-service.jpg"
                title="Sinh nhật"
                text="Đến với Glorian chắc chắn bạn sẽ có được những khoảnh khắc đáng nhớ về một sinh nhật vừa ấm cúng vừa sang trọng bên bạn bè và người thân. Glorian luôn sẵn lòng chào đón bạn cùng với những người thân yêu đến tổ chức tiệc sinh nhật tại nơi đây."
                link="/birthday-service"
                name="Xem dịch vụ"
              />
          </div>
          <div className="col-md-7 col-xs-12" style={{marginTop: "2%", fontFamily: "'Nunito', sans-serif"}}>
              <h1 style={style}>Dịch vụ cho sinh nhật</h1>
              Tiệc sinh nhật là dịp để tổ chức một bữa tiệc đáng nhớ nhất của mỗi người khi đây là cột mốc đánh dấu thêm tuổi mới. Tổ chức một bữa tiệc sinh nhật vui vẻ, ấn tượng sẽ là món quà ngọt ngào thay cho lời chúc mừng đến những người mà bạn quan tâm. Để kỷ niệm một ngày có ý nghĩa đặc biệt quan trọng như thế, bạn luôn mong muốn đem lại những giây phút khó quên và ý nghĩa nhất cho những người yêu thương ấy. Hiểu được những mong muốn, tâm tư đó, Glorian luôn cố gắng và nỗ lực không ngừng để mang đến những buổi tiệc sinh nhật lãng mạn và ấn tượng với những gam màu, những sắc thái riêng biệt. Glorian là địa điểm tổ chức sinh nhật trọn gói chuyên nghiệp và lý tưởng nhất!
          </div>
        </div>
      </div>
      <Footer/>

    </>
  )
}