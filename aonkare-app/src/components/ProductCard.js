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
