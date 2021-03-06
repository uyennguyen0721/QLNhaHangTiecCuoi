import React from 'react';
import '../../App.css';
import { Button } from '../layout/Button';
import '../css/HeroSection.css';
import { useSelector } from 'react-redux';

function HeroSection() {
  const user = useSelector(state => state.user.user)
  let book = <>
    <Button
          className='btns'
          buttonStyle='btn--outline'
          buttonSize='btn--large'
          to='/login'
        >
          ĐẶT TIỆC NGAY
    </Button>
  </>
  if (user !== null && user !== undefined) {
    book = <>
      <Button
            className='btns'
            buttonStyle='btn--outline'
            buttonSize='btn--large'
            to='/book-party'
          >
            ĐẶT TIỆC NGAY
      </Button>
    </>
  }
  return (
    <div className='hero-container'>
      <video src='/videos/video.mp4' autoPlay loop muted />
      <h1>Glorian Restaurant</h1>
      <p>Nhà hàng tiệc cưới Glorian là địa điểm tổ chức tiệc cưới và hội nghị trọn gói chuyên nghiệp uy tín bật nhất TP HCM tọa lạc tọa lạc ngay giao lộ huyết mạch Phạm Văn Đồng tiếp nối các quận huyện trung tâm thành phố – nằm trong vòng an ninh.</p>
      <div className='hero-btns'>
        {book}
      </div>
    </div>
  );
}

export default HeroSection;