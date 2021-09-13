import React from 'react';
import '../../App.css';
import HeroSection from '../HeroSection';
import Footer from '../Footer';
import GridTwo from '../GridTwo';
import GridImages from '../GridImages';

function Home() {
  return (
    <>
      <HeroSection />
      <GridTwo />
      <GridImages/>
      <Footer />
    </>
  );
}

export default Home;