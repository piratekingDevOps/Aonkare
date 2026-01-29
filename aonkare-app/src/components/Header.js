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
