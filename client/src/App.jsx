import React, { useState } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import "./App.css";
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import HomePage from "./Routes/HomePage/HomePage";
import Navbar from "./components/Navbar/Navbar";
import { HotelsContextProvider } from "./context/HotelsContext";
import BookNowView from "./Routes/BookNowView/BookNowView";
import InfoView from "./Routes/InfoView/InfoView";
import UpdateView from "./Routes/UpdateView/UpdateView";
import EmployeesView from "./Routes/EmployeesView/EmployeesView";
import CustomersView from "./Routes/CustomersView/CustomersView";
import HotelsView from "./Routes/HotelsView/HotelsView";
import BookingsView from "./Routes/BookingsView/BookingsView";
import RoomsView from "./Routes/RoomsView/RoomsView";

const App = () => {

  return (
      <HotelsContextProvider>
        <BrowserRouter>
            <Navbar/>
            <div className="container mt-5">
                <Routes>
                  <Route path="/welcome" element={<HomePage />} />
                  <Route path="/employees" element={<EmployeesView />} />
                  <Route path="/rooms" element={<RoomsView />} />
                  <Route path="/customers" element={<CustomersView />} />
                  <Route path="/bookings" element={<BookingsView />} />
                  <Route path="/hotels" element={<HotelsView />} />
                  <Route path="/booknow" element={<BookNowView />} />
                  <Route path="/:id/info" element={<InfoView />} />
                  <Route path="/:id/update" element={<UpdateView />} />
                </Routes>
            </div>
        </BrowserRouter>
      </HotelsContextProvider>
  );
}

export default App;
