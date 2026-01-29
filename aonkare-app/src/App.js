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
