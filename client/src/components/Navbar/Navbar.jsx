import React from "react";
import { NavLink } from "react-router-dom";
import styles from "./styles.module.css";

const UserRole = {
    NO_ROLE: 0,
    CUSTOMER: 1,
    EMPLOYEE: 2
};


const Navbar = ({ role, onHomeClick }) => {
    console.log("Role in Navbar:", role);
    return (
        <div className = {styles.navbar}>
            <div className={styles.leftcontent}>
                <NavLink to="/welcome" exact activeClassName="active" className={styles.text} onClick={onHomeClick}>Home</NavLink>
            </div>
            <div className={styles.rightcontent}>
                {role === 1 && (
                    <NavLink to="/search" exact activeClassName="active" className={styles.text}>Search</NavLink>
                )}
                {role === 2 && (
                    <div>
                        <NavLink to="/search" exact activeClassName="active" className={styles.text}>Search</NavLink>
                        <NavLink to="/rooms" exact activeClassName="active" className={styles.text}>Rooms</NavLink>
                        <NavLink to="/booking" exact activeClassName="active" className={styles.text}>Booking</NavLink> 
                    </div>               
                )}
            </div>
        </div>
    )
}

export default Navbar;