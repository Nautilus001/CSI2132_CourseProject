import React, { useState } from "react";
import styles from "./styles.module.css";
import InputFrame from "../../components/InputFrame/InputFrame";
import DropdownMenu from "../../components/DropdownMenu/DropdownMenu";

const SearchPage = () => {

    const [searchParams, setSearchParams] = useState({
        startDate: '',
        endDate: '',
        minCapacity: '',
        maxRooms: '',
        city: '',
        chain: '',
        rating: '',
    });

    const handleChange = (fieldName, value) => {
        
        setSearchParams(prevState => ({
            ...prevState,
            [fieldName]: value
        }));

        console.log(searchParams);
    };

    return (
        <div className={styles.searchcontainer}>
            <div className={styles.inputs}>
                <div className={styles.inputsrow}>
                    <InputFrame 
                        label={"Start Date: "} 
                        defaultValue={"YYYY-MM-DD"} 
                        type={"date"}
                        onChange={(value) => handleChange("startDate", value)}
                    />
                    <InputFrame 
                        label={"End Date:"} 
                        defaultValue={"YYYY-MM-DD"}
                        type={"date"}
                        onChange={(value) => handleChange("endDate", value)}
                    />
                </div>
                <div className={styles.inputsrow}>
                    <InputFrame 
                        label={"Minimum Room Capacity:"}
                        defaultValue={searchParams.minCapacity}
                        type={'text'}
                        onChange={(value) => handleChange("minCapacity", value)}
                        stripAlpha={true}
                    />
                    <InputFrame 
                        label={"Max. Rooms in Hotel:"} 
                        defaultValue={searchParams.maxRooms}
                        type={'text'}
                        onChange={(value) => handleChange("maxRooms", value)}
                        stripAlpha={true}
                    />
                </div>
                <div className={styles.inputsrow}>
                    <DropdownMenu 
                        label={"City:"} 
                        options={[
                            "CityA", 
                            "CityB",
                            "CityC",
                            "CityD",
                            "CityE",
                            "CityF",
                            "CityG",
                            "CityH",
                        ]}
                        selectedOption={searchParams.city}
                        onSelect={(value) => handleChange("city", value)}
                    />
                    <DropdownMenu 
                        label={"Hotel Chain:"} 
                        options={[
                            "Simple Stay", 
                            "Grand Suites", 
                            "Paradise Hotels", 
                            "Tranquil Inns", 
                            "Serene Retreats"
                        ]}
                        selectedOption={searchParams.chain}
                        onSelect={(value) => handleChange("chain", value)}
                    />
                </div>
                <div className={styles.inputsrow}>
                    <DropdownMenu 
                        label={"Minimum Star Rating:"} 
                        options={[
                            "★", 
                            "★★", 
                            "★★★", 
                            "★★★★", 
                            "★★★★★"
                        ]}
                        selectedOption={searchParams.rating}
                        onSelect={(value) => handleChange("rating", value)}
                    />
                </div>
            </div>
            <div className={styles.button}>
                <div className={styles.text}>
                    Go!
                </div>
            </div>
        </div>
    )
}

export default SearchPage;