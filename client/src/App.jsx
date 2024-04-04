import React, { useState } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import "./App.css";
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import HomePage from "./Routes/HomePage/HomePage";
import Navbar from "./components/Navbar/Navbar";
import { HotelsContextProvider } from "./context/HotelsContext";
import BookNowView from "./Routes/BookNowView/BookNowView";
import InfoView from "./Routes/InfoView/InfoView";

const App = () => {
  //const [user_role, setUserRole] = useState(0);

  // const handleRoleAssignment = (value) => {
  //   setUserRole(value);
  // };

  // const handleRoleReset = () => {
  //   setUserRole(0);
  // };

  return (
      <HotelsContextProvider>
        <BrowserRouter>
            <Navbar/>
            <div className="container mt-5">
                <Routes>
                  <Route 
                    exact path="/welcome" 
                    element={<HomePage/>} 
                  />
                  <Route path="/booknow" element={<BookNowView />} />
                  <Route path="/employee" element={<BookNowView />} />
                  <Route path="/employee/rooms" element={<InfoView />} />
                </Routes>
            </div>
        </BrowserRouter>
      </HotelsContextProvider>
  );
}

export default App;
