import React from 'react';
import styles from './styles.module.css';
import { useNavigate } from "react-router-dom";

const OptionButton = ({ label, route_to, background_color, text_color, onClick}) => {

    const navigate = useNavigate();

    const buttonStyle = {
        backgroundColor: background_color || 'rgba(143, 181, 129, 0.566)',
    };

    const textStyle = {
        color: text_color || 'rgba(0, 0, 0, 1)',
    }


    const handleClick = () => {
        if (onClick) {
            onClick();
        }
        navigate(route_to);
    };

    return (
        <div className={styles.optionbutton} onClick={handleClick} style={buttonStyle}>
            <div className={styles.text} style={textStyle}>
                {label}
            </div>
        </div>
    );
};

OptionButton.defaultProps = {
    label: 'Input here:',
    route_to: '/welcome',
    onClick: null,
};

export default OptionButton;