import React from 'react';
import './Footer.css';
import { Button } from './Button';
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
            <input
              className='footer-input'
              name='email'
              type='email'
              placeholder='Nhập email của bạn'
            />
            <Button buttonStyle='btn--outline'>Đăng ký</Button>
          </form>
        </div>
      </section>
      <div class='footer-links'>
        <div className='footer-link-wrapper'>
          <div class='footer-link-items address'>
            <h3>Trung tâm HN-TC Glorian</h3>
            <Link to='/'>
              <i class="fas fa-map-marker-alt"/>
              18 Cộng Hòa, Phường 4, Tân Bình, TPHCM
            </Link>
            <Link to='/'>
              <i class="fas fa-phone"/>
              0943750941
            </Link>
            <Link to='/'>
              <i class="fas fa-envelope"/>
              glorian@gmail.com
            </Link>
          </div>
        </div>
        <div className='footer-link-wrapper'>
          <div class="footer-link-items contact">
            <h3>Về chúng tôi</h3>
            <Link to='/'>Trang chủ</Link>
            <Link to='/'>Thực đơn</Link>
            <Link to='/'>Đồ uống</Link>
            <Link to='/'>Dịch vụ</Link>
          </div>
          <div class="footer-link-items contact">
            <h3>Liên hệ</h3>
            <Link to='/'>Instagram</Link>
            <Link to='/'>Facebook</Link>
            <Link to='/'>Youtube</Link>
            <Link to='/'>Tiktok</Link>
          </div>
        </div>
      </div>
      <section class='social-media'>
        <div class='social-media-wrap'>
          <div class='footer-logo'>
            <Link to='/' className='social-logo'>
              <img src="/logo.png" alt="logo"/>
            </Link>
          </div>
          <small class='website-rights'>GLORIAN © 2021</small>
          <div class='social-icons'>
            <Link
              class='social-icon-link facebook'
              href='https://www.facebook.com/nttu.dqt/'
              target='_blank'
              aria-label='Facebook'
            >
              <i class='fab fa-facebook-f' />
            </Link>
            <Link
              class='social-icon-link instagram'
              to='https://www.instagram.com/uyennguyen0721/'
              target='_blank'
              aria-label='Instagram'
            >
              <i class='fab fa-instagram' />
            </Link>
            <Link
              class='social-icon-link youtube'
              to='https://www.youtube.com/channel/UCHdPjoBVkgyOpipeZ4vgVKg'
              target='_blank'
              aria-label='Youtube'
            >
              <i class='fab fa-youtube' />
            </Link>
            <Link
              class='social-icon-link tiktok'
              to='https://www.tiktok.com/@uyennguyen_21?'
              target='_blank'
              aria-label='TikTok'
            >
              <i class="fab fa-tiktok"/>
            </Link>
            <Link
              class='social-icon-link twitter'
              to='/'
              target='_blank'
              aria-label='LinkedIn'
            >
              <i class='fab fa-linkedin' />
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}

export default Footer;