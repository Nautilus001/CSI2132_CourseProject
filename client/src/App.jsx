import React, { useState } from "react";
import "./App.css";
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import GlobalLandingPage from "./Pages/GlobalLandingPage/GlobalLandingPage";
import EmployeeLandingPage from "./Pages/EmployeeLandingPage/EmployeeLandingPage";
import Navbar from "./components/Navbar/Navbar";
import SearchPage from "./Pages/SearchPage/SearchPage";

function App() {
  const [user_role, setUserRole] = useState(0);

  const handleRoleAssignment = (value) => {
    setUserRole(value);
  };

  const handleRoleReset = () => {
    setUserRole(0);
  };

  return (
    <BrowserRouter>
      <div className="page">
        <Navbar role={user_role} onHomeClick={handleRoleReset}/>
        <div className="body">
            <Routes>
              <Route 
                exact path="/welcome" 
                element={<GlobalLandingPage setRole={handleRoleAssignment} />} 
              />
              <Route path="/search" element={<SearchPage />} />
              <Route exact path="/employee/" element={<EmployeeLandingPage />} />
              <Route path="/search" element={<SearchPage />} />
            </Routes>
        </div>
      </div>
    </BrowserRouter>
  );
}

export default App;
