import React, { Fragment, useState } from "react";
import { useNavigate } from "react-router-dom";


const HomePage = ({ setRole }) => {
    const navigate = useNavigate();

    const handleRoleClick = (value) => {
        setRole(value);
        switch(value) {
            case 0:
                navigate("/booknow");
                break;
            case 1:
                navigate("/employee");
                break;
            case 2:
                navigate("/admin");
                break;
        }
        console.log("User clicked:" + value);
    }

    return (
        <div className="container">
            <div className="row"></div>
            <div className="row xs-6"></div>
                <div className="col d-flex flex-column text-center">
                    <div className="h1 p-5 center">Please Select Your Role</div>
                </div>
            <div className="row"></div> 
            <div className="row py-5">
                <div className="col d-flex flex-column justify-content-center">
                <div className="btn btn-success p-5" onClick={() => handleRoleClick(0)}> 
                        <div className="h2">Customer</div> 
                    </div>
                </div>
                <div className="col d-flex flex-column justify-content-center">
                    <div className="btn btn-primary p-5" onClick={() => handleRoleClick(1)}> 
                        <div className="h2">Employee</div>
                    </div>  
                </div>
                <div className="col d-flex flex-column justify-content-center">
                    <div className="btn btn-danger p-5" onClick={() => handleRoleClick(2)}> 
                        <div className="h2">Admin</div> 
                    </div>                
                </div> 

            </div>
        </div>
    )
}

export default HomePage;