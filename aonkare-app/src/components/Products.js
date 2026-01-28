import React from 'react';
import ProductCard from './ProductCard';

const productList = [
  { id:1, name:'Herbal Capsules', description:'Boost your immunity with our herbal capsules.', image:'https://images.unsplash.com/photo-1619473165033-5bc86b2e7ee9?fit=crop&w=400&q=80' },
  { id:2, name:'Ayurvedic Oil', description:'Experience healing with Ayurvedic oils.', image:'https://images.unsplash.com/photo-1611234829875-0dc8f6933d91?fit=crop&w=400&q=80' },
  { id:3, name:'Herbal Tea', description:'Relax and detox with calming herbal teas.', image:'https://images.unsplash.com/photo-1611078480455-812f1a5e4f1b?fit=crop&w=400&q=80' }
];

function Products({ addToCart }) {
  return (
    <section className="products" id="products">
      <h3>Our Products</h3>
      <div className="product-grid">
        {productList.map(p => <ProductCard key={p.id} product={p} addToCart={addToCart} />)}
      </div>
    </section>
  );
}

export default Products;
