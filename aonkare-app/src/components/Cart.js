import React from 'react';

function Cart({ items, closeCart }) {
  return (
    <div className="cart-popup">
      <h4>Your Cart</h4>
      <ul>
        {items.length === 0 ? <li>Cart is empty</li> : items.map((item,i) => <li key={i}>{item}</li>)}
      </ul>
      <button className="close-cart" onClick={closeCart}>Close</button>
    </div>
  );
}

export default Cart;
