import React from "react";
import { useMoralis } from "react-moralis"

function App() {
  const {
    authenticate,
    isAuthenticated,
    user } = useMoralis();
  

  if (!isAuthenticated) {
    return (
      <div> <button onClick={() => authenticate()}>Authentification</button>
      </div>
    );
  }

  return (
    <div>
      <h1>bienvenue {user.get("username")}</h1>
    </div>
  )
}
export default App;
