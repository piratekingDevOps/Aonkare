import React from 'react';

function Header({ toggleCart, cartCount }) {
  return (
    <header>
      <h1>Aonkare</h1>
      <nav>
        <a href="#home">Home</a>
        <a href="#products">Products</a>
        <a href="#contact">Contact</a>
        <button className="cart-btn" onClick={toggleCart}>Cart ({cartCount})</button>
      </nav>
    </header>
  );
}

export default Header;
