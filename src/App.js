import logo from './logo.svg';
import './App.css';

function App() {
  const API_KEY = process.env.REACT_APP_MAIN_API_URL
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
        <div>
          <div><small>REACT_APP_MAIN_API_URL is <b>{API_KEY}</b></small></div>
        </div>
      </header>
    </div>
  );
}

export default App;
