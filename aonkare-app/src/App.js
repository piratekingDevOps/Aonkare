import React, { useState } from 'react';
import Header from './components/Header';
import Hero from './components/Hero';
import Products from './components/Products';
import Cart from './components/Cart';
import './App.css';

function App() {
  const [cartItems, setCartItems] = useState([]);
  const [showCart, setShowCart] = useState(false);

  const addToCart = (product) => setCartItems([...cartItems, product]);

  return (
    <div>
      <Header toggleCart={() => setShowCart(!showCart)} cartCount={cartItems.length} />
      <Hero />
      <Products addToCart={addToCart} />
      {showCart && <Cart items={cartItems} closeCart={() => setShowCart(false)} />}
    </div>
  );
}

export default App;
// test deploy
