import React from "react";
import { useLocation, useNavigate } from 'react-router';

import 'devextreme/dist/css/dx.light.css';
import Button from 'devextreme-react/button';

import "../Buttons.css";
import "./navigationElement.scss";

function AnalyticsDashboardButton() {
    const navigate = useNavigate();
    return (
    <Button
        text="Analytics Dashboard"
        onClick={() => {
            navigate("/analytics-dashboard");
        }}
        stylingMode="contained"
        icon="isblank"
    />
    );
}

function MainButton() {
    const navigate = useNavigate();
    return (
        <Button
            text="Lists Overview"
            onClick={() => {
                navigate("/");
            }}
            stylingMode="contained"
            icon="isblank"
        />
    );
}

export default function NavigationElement() {
    const location = useLocation();
    let button = null;

    if (location.pathname === '/') {
        button = <AnalyticsDashboardButton />;
    }
    if (location.pathname === '/analytics-dashboard') {
        button = <MainButton />;
    }

    return (
        <div id="navigationElement">
            <div id="navigateButtonOne">
                {button}
            </div>
        </div>
    );
};