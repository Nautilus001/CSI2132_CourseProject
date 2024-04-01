import React, { Fragment, useState } from "react";
import styles from "./styles.module.css";
import OptionButton from "../../components/OptionButton/OptionButton";

const GlobalLandingPage = ({ setRole }) => {

    const handleClick = (value) => {
        setRole(value);
        console.log("User clicked:" + value);
    }

    return (
        <div className={styles.optionbody}>
            <div className={styles.optionprompt}>
                <div className={styles.text}>Please Select Your Role</div>
            </div>
            <div className={styles.optioncontainer}>
                <OptionButton 
                    label={"Customer"} 
                    route_to={"/customer/search"} 
                    background_color={"rgba(42, 114, 33, 1"}
                    text_color={"rgba(255, 255, 255, 1)"}
                    onClick={() => handleClick(1)}
                />
                <OptionButton 
                    label={"Employee"} 
                    route_to={"/employee"} 
                    background_color={"rgba(160, 174, 205, 1)"}
                    onClick={() => handleClick(2)}
                />
            </div>
        </div>
    )
}

export default GlobalLandingPage;