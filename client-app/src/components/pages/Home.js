import React from 'react';
import '../../App.css';
import HeroSection from '../layout/HeroSection';
import Footer from '../layout/Footer';
import GridTwo from '../layout/GridTwo';
import GridImages from '../layout/GridImages';

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