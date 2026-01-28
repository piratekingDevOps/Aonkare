import React from 'react';

function ProductCard({ product, addToCart }) {
  return (
    <div className="product-card">
      <img src={product.image} alt={product.name} />
      <div className="info">
        <h4>{product.name}</h4>
        <p>{product.description}</p>
        <button onClick={() => addToCart(product.name)}>Add to Cart</button>
      </div>
    </div>
  );
}

export default ProductCard;
