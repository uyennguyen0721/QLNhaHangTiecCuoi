import React from 'react';
import '../App.css';
import { Button } from './Button';
import './HeroSection.css';

function HeroSection() {
  return (
    <div className='hero-container'>
      <video src='/videos/video.mp4' autoPlay loop muted />
      <h1>Glorian Restaurant</h1>
      <p>Nhà hàng tiệc cưới Glorian là địa điểm tổ chức tiệc cưới và hội nghị trọn gói chuyên nghiệp uy tín bật nhất TP HCM tọa lạc tọa lạc ngay giao lộ huyết mạch Phạm Văn Đồng tiếp nối các quận huyện trung tâm thành phố – nằm trong vòng an ninh.</p>
      <div className='hero-btns'>
        <Button
          className='btns'
          buttonStyle='btn--outline'
          buttonSize='btn--large'
        >
          ĐẶT TIỆC NGAY
        </Button>
        {/* <Button
          className='btns'
          buttonStyle='btn--primary'
          buttonSize='btn--large'
          onClick={console.log('hey')}
        >
          WATCH TRAILER <i className='far fa-play-circle' />
        </Button> */}
      </div>
    </div>
  );
}

export default HeroSection;