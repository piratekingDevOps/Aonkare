#!/bin/bash

# Base directory
mkdir -p aonkare-app/{public,src/components}

# -----------------------------
# Public index.html
# -----------------------------
cat > aonkare-app/public/index.html <<EOL
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Aonkare - Ayurvedic Medicines</title>
</head>
<body>
  <div id="root"></div>
</body>
</html>
EOL

# -----------------------------
# src/index.js
# -----------------------------
cat > aonkare-app/src/index.js <<EOL
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './index.css';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);
EOL

# -----------------------------
# src/App.js
# -----------------------------
cat > aonkare-app/src/App.js <<EOL
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
EOL

# -----------------------------
# src/App.css
# -----------------------------
cat > aonkare-app/src/App.css <<EOL
body { font-family: Arial, sans-serif; background:#f9f9f4; margin:0; }
h1,h2,h3,h4,p { margin:0; padding:0; }

header {
  background: #4CAF50; color: white; padding:20px 0; text-align:center;
}
header nav a { margin: 0 15px; color:white; font-weight:bold; }
header .cart-btn { background:#dcedc8; border:none; border-radius:5px; padding:5px 10px; cursor:pointer; margin-left:15px; }

.hero {
  text-align:center; padding:80px 20px;
  background: url('https://images.unsplash.com/photo-1607746882042-944635dfe10e?fit=crop&w=1600&q=80') center/cover no-repeat;
  color:white;
}

.products { max-width:1200px; margin:0 auto; padding:60px 20px; }
.product-grid { display:grid; grid-template-columns:repeat(auto-fit,minmax(250px,1fr)); gap:30px; }
.product-card { background:white; border-radius:8px; overflow:hidden; box-shadow:0 2px 8px rgba(0,0,0,0.1); }
.product-card img { width:100%; height:200px; object-fit:cover; }
.product-card .info { padding:20px; }
.product-card button { background:#4CAF50; color:white; border:none; padding:10px 20px; border-radius:5px; cursor:pointer; }
.product-card button:hover { background:#43a047; }

/* Cart Popup */
.cart-popup {
  position:fixed; top:20px; right:20px; width:300px; max-height:400px; background:#fff; border:2px solid #4CAF50;
  border-radius:10px; box-shadow:0 6px 15px rgba(0,0,0,0.2); padding:20px; display:flex; flex-direction:column; z-index:1000; overflow-y:auto;
}
.cart-popup h4 { color:#4CAF50; text-align:center; }
.cart-popup ul { list-style:none; padding:0; }
.cart-popup ul li { padding:5px 0; border-bottom:1px solid #eee; }
.cart-popup .close-cart { margin-top:15px; background:#4CAF50; color:white; border:none; border-radius:5px; padding:10px; cursor:pointer; }
EOL

# -----------------------------
# src/index.css
# -----------------------------
cat > aonkare-app/src/index.css <<EOL
body { margin:0; padding:0; }
EOL

# -----------------------------
# Components
# -----------------------------
# Header.js
cat > aonkare-app/src/components/Header.js <<EOL
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
EOL

# Hero.js
cat > aonkare-app/src/components/Hero.js <<EOL
import React from 'react';

function Hero() {
  return (
    <section className="hero" id="home">
      <h2>Natural Wellness, Ayurveda Inspired</h2>
      <p>Explore our range of pure Ayurvedic medicines for a healthier life</p>
    </section>
  );
}

export default Hero;
EOL

# ProductCard.js
cat > aonkare-app/src/components/ProductCard.js <<EOL
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
EOL

# Products.js
cat > aonkare-app/src/components/Products.js <<EOL
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
EOL

# Cart.js
cat > aonkare-app/src/components/Cart.js <<EOL
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
EOL

# -----------------------------
# package.json
# -----------------------------
cat > aonkare-app/package.json <<EOL
{
  "name": "aonkare-app",
  "version": "1.0.0",
  "private": true,
  "homepage": "https://piratekingDevOps.github.io/Aonkare/",
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build"
  }
}
EOL

echo "✅ Full React Aonkare app structure created in 'aonkare-app/'"

