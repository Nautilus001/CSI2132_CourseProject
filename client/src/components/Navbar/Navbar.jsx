import React, { useContext } from "react";
import { HotelsContext } from "../../context/HotelsContext";

const Navbar = () => {

    const {user_role, setUserRole} = useContext(HotelsContext);

    let role = user_role;

    console.log("Role in Navbar:", user_role);

    return (
        <nav className="navbar navbar-expand-sm bg-light px-4 shadow h5">
            <div className="container-fluid">
                <ul className="navbar-nav">
                    <li className="nav-item px-2">
                    <a className="nav-link" href="/welcome">Home</a>
                    </li>
                </ul>
            </div>
            <div className="container-fluid justify-content-end g-5">
                <ul className="navbar-nav">
                    {role >= 0 && (
                        <ul className="navbar-nav">
                            <li className="nav-item px-2">
                                <a className="nav-link" href="/booknow">Book Now!</a>
                            </li>
                            <li className="nav-item px-2">
                                <a className="nav-link" href="/mybookings">My Bookings</a>
                            </li>
                        </ul>
                    )}
                    {role >= 1 && (
                        <ul className="navbar-nav">
                            <li className="nav-item px-2">
                                <a className="nav-link" href="/rooms">Rooms</a>
                            </li>
                            <li className="nav-item px-2">
                                <a className="nav-link" href="/bookings">Bookings</a>
                            </li>
                            <li className="nav-item px-2">
                                <a className="nav-link" href="/customers">Customers</a>
                            </li>
                        </ul>               
                    )}
                    {role >= 2 && (
                        <ul className="navbar-nav">
                            <li className="nav-item px-2">
                            <a className="nav-link" href="/employees">Employees</a>
                            </li>
                            <li className="nav-item px-2">
                            <a className="nav-link" href="/hotels">Hotels</a>
                            </li>  
                        </ul>          
                    )}
                </ul>
                
            </div>
        </nav>
    )
}

export default Navbar;