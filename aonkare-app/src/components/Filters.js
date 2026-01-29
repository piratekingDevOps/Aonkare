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
