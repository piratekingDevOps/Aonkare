#!/bin/bash
set -e

APP_DIR="aonkare-app/src"
COMP_DIR="$APP_DIR/components"

echo "��� Upgrading Aonkare app to marketplace UI..."

mkdir -p "$COMP_DIR"

# ---------------- HEADER ----------------
cat > "$COMP_DIR/Header.js" <<'EOF'
import "./Header.css";

export default function Header({ cartCount }) {
  return (
    <header className="header">
      <div className="logo">Aonkare</div>
      <input
        className="search"
        placeholder="Search Ayurvedic medicines, oils, supplements..."
      />
      <div className="nav">
        <span>Account</span>
        <span>Orders</span>
        <span className="cart">Cart ({cartCount})</span>
      </div>
    </header>
  );
}
EOF

# ---------------- FILTERS ----------------
cat > "$COMP_DIR/Filters.js" <<'EOF'
import "./Filters.css";

export default function Filters() {
  return (
    <aside className="filters">
      <h3>Category</h3>
      <label><input type="checkbox" /> Capsules</label>
      <label><input type="checkbox" /> Oils</label>
      <label><input type="checkbox" /> Powders</label>

      <h3>Price</h3>
      <input type="range" min="100" max="2000" />

      <h3>Rating</h3>
      <p>⭐⭐⭐⭐ & up</p>
    </aside>
  );
}
EOF

# ---------------- PRODUCT CARD ----------------
cat > "$COMP_DIR/ProductCard.js" <<'EOF'
import "./ProductCard.css";

export default function ProductCard({ product, addToCart }) {
  return (
    <div className="product-card">
      <img src={product.image} alt={product.name} />
      <h4>{product.name}</h4>
      <div className="rating">⭐⭐⭐⭐☆ (1,234)</div>
      <div className="price">
        ₹{product.price}
        <span className="strike">₹{product.price + 300}</span>
      </div>
      <button onClick={() => addToCart(product)}>Add to Cart</button>
    </div>
  );
}
EOF

# ---------------- PRODUCTS GRID ----------------
cat > "$COMP_DIR/Products.js" <<'EOF'
import ProductCard from "./ProductCard";
import "./Products.css";

const products = [
  { id: 1, name: "Herbal Capsules", price: 499, image: "https://via.placeholder.com/200" },
  { id: 2, name: "Ayurvedic Oil", price: 699, image: "https://via.placeholder.com/200" },
  { id: 3, name: "Immunity Booster", price: 899, image: "https://via.placeholder.com/200" },
  { id: 4, name: "Digestive Powder", price: 399, image: "https://via.placeholder.com/200" },
];

export default function Products({ addToCart }) {
  return (
    <div className="products-grid">
      {products.map(p => (
        <ProductCard key={p.id} product={p} addToCart={addToCart} />
      ))}
    </div>
  );
}
EOF

# ---------------- APP.JS ----------------
cat > "$APP_DIR/App.js" <<'EOF'
import { useState } from "react";
import Header from "./components/Header";
import Filters from "./components/Filters";
import Products from "./components/Products";
import "./App.css";

function App() {
  const [cart, setCart] = useState([]);

  const addToCart = (product) => {
    setCart([...cart, product]);
  };

  return (
    <>
      <Header cartCount={cart.length} />
      <div className="layout">
        <Filters />
        <main>
          <h2>Best Sellers in Ayurveda</h2>
          <Products addToCart={addToCart} />
        </main>
      </div>
    </>
  );
}

export default App;
EOF

# ---------------- CSS ----------------
cat > "$APP_DIR/App.css" <<'EOF'
body {
  margin: 0;
  font-family: Arial, sans-serif;
  background: #f1f3f6;
}

.layout {
  display: flex;
  padding: 20px;
}

main {
  flex: 1;
  padding-left: 20px;
}
EOF

cat > "$COMP_DIR/Header.css" <<'EOF'
.header {
  position: sticky;
  top: 0;
  display: flex;
  align-items: center;
  padding: 10px 20px;
  background: #131921;
  color: white;
  z-index: 100;
}

.logo {
  font-size: 24px;
  font-weight: bold;
  margin-right: 20px;
}

.search {
  flex: 1;
  padding: 8px;
  margin-right: 20px;
}

.nav span {
  margin-left: 15px;
  cursor: pointer;
}

.cart {
  background: orange;
  padding: 5px 10px;
  border-radius: 4px;
  color: black;
}
EOF

cat > "$COMP_DIR/Filters.css" <<'EOF'
.filters {
  width: 220px;
  background: white;
  padding: 15px;
  border-radius: 4px;
}

.filters h3 {
  margin-top: 0;
}
EOF

cat > "$COMP_DIR/Products.css" <<'EOF'
.products-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
  gap: 20px;
}
EOF

cat > "$COMP_DIR/ProductCard.css" <<'EOF'
.product-card {
  background: white;
  padding: 15px;
  border-radius: 4px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}

.product-card img {
  width: 100%;
}

.product-card button {
  margin-top: 10px;
  width: 100%;
  background: #ff9f00;
  border: none;
  padding: 10px;
  cursor: pointer;
}

.price {
  font-weight: bold;
}

.strike {
  text-decoration: line-through;
  margin-left: 10px;
  color: gray;
}
EOF

echo "✅ Aonkare upgraded to marketplace-style UI"
echo "➡ Run: npm start (local) or git push to deploy"

