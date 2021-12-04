import React from 'react';
import '../css/Footer.css';
import { Button } from '../layout/Button';
import { Link } from 'react-router-dom';

function Footer() {
  return (
    <div className='footer-container'>
      <section className='footer-subscription'>
        <p className='footer-subscription-heading'>
          Trở thành thành viên của Glorian để nhận nhiều ưu đãi hơn nhé!
        </p>
        <p className='footer-subscription-text'>
          Bạn có thể hủy đăng ký bất cứ lúc nào
        </p>
        <div className='input-areas'>
          <form>
            <Button to="/register" buttonStyle='btn--outline'>Đăng ký ngay</Button>
          </form>
        </div>
      </section>
      <div className='footer-links'>
        <div className='footer-link-wrapper'>
          <div className='footer-link-items address'>
            <h3>Trung tâm HN-TC Glorian</h3>
            <Link to='/'>
              <i className="fas fa-map-marker-alt"/>
              18 Cộng Hòa, Phường 4, Tân Bình, TPHCM
            </Link>
            <Link to='/'>
              <i className="fas fa-phone"/>
              0943750941
            </Link>
            <Link to='/'>
              <i className="fas fa-envelope"/>
              glorian@gmail.com
            </Link>
          </div>
        </div>
        <div className='footer-link-wrapper'>
          <div className="footer-link-items contact">
            <h3>Về chúng tôi</h3>
            <Link to='/'>Trang chủ</Link>
            <Link to='/'>Thực đơn</Link>
            <Link to='/'>Đồ uống</Link>
            <Link to='/'>Dịch vụ</Link>
          </div>
          <div className="footer-link-items contact">
            <h3>Liên hệ</h3>
            <Link to='/'>Instagram</Link>
            <Link to='/'>Facebook</Link>
            <Link to='/'>Youtube</Link>
            <Link to='/'>Tiktok</Link>
          </div>
        </div>
      </div>
      <section className='social-media'>
        <div className='social-media-wrap'>
          <div className='footer-logo'>
            <Link to='/' className='social-logo'>
              <img src="/logo.png" alt="logo"/>
            </Link>
          </div>
          <small className='website-rights'>GLORIAN © 2021</small>
          <div className='social-icons'>
            <Link
              className='social-icon-link facebook'
              to='/'
              target='_blank'
              aria-label='Facebook'
            >
              <i className='fab fa-facebook-f' />
            </Link>
            <Link
              className='social-icon-link instagram'
              to='/'
              target='_blank'
              aria-label='Instagram'
            >
              <i className='fab fa-instagram' />
            </Link>
            <Link
              className='social-icon-link youtube'
              to='/'
              target='_blank'
              aria-label='Youtube'
            >
              <i className='fab fa-youtube' />
            </Link>
            <Link
              className='social-icon-link tiktok'
              to='/'
              target='_blank'
              aria-label='TikTok'
            >
              <i className="fab fa-tiktok"/>
            </Link>
            <Link
              className='social-icon-link twitter'
              to='/'
              target='_blank'
              aria-label='LinkedIn'
            >
              <i className='fab fa-linkedin' />
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}

export default Footer;