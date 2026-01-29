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
