import React, { Fragment, useState } from "react";
import styles from "./styles.module.css";
import OptionButton from "../../components/OptionButton/OptionButton";

const EmployeeLandingPage = () => {

    return (
        <div className={styles.optionbody}>
            <div className={styles.optionprompt}>
                <div className={styles.text}>Please Select A Service</div>
            </div>
            <div className={styles.optioncontainer}>
                <OptionButton 
                    label={"Search"} 
                    route_to={"/search"} 
                    background_color={"rgba(42, 114, 33, 1"}
                    text_color={"rgba(255, 255, 255, 1)"}
                />
                <OptionButton 
                    label={"Rooms"} 
                    route_to={"/employee/rooms"} 
                    background_color={"rgba(160, 174, 205, 1)"}
                />
                <OptionButton 
                    label={"Bookings"} 
                    route_to={"/employee/bookings"} 
                    background_color={"rgba(215, 190, 130, 1)"}
                />
            </div>
        </div>
    )
}

export default EmployeeLandingPage;