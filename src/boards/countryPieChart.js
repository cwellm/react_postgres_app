import 'devextreme/dist/css/dx.light.css';


import React from 'react';
import PieChart, {Label, Series, Tooltip} from 'devextreme-react/pie-chart';
import Button from 'devextreme-react/button';

import { useNavigate } from 'react-router';


const countryData = [
    {
        country: 'China',
        numberOfAddressesWithCountry: 1002
    },
    {
        country: 'United States',
        numberOfAddressesWithCountry: 716
    }
]

const customizeText = (countryData) => {
    return countryData.value + " addresses";
}

function CountryPieChart() {
    const navigate = useNavigate();
    return (
        <div>
            <Button
                text="Lists Overview"
                onClick={() => {
                    navigate("/");
                }}
                stylingMode="contained"
                icon="isblank"
            />
        <PieChart
            id = "country-pie-chart"
            type="doughnut"
            dataSource={countryData}
            title="Number of Addresses by Country"
        >
            <Series
                argumentField="country"
                valueField="numberOfAddressesWithCountry"
                >
                <Label
                    visible={true}
                    position="outside"
                    customizeText={customizeText}
                />
            </Series>
            <Tooltip enabled={true} />
        </PieChart>
        </div>
    );
}

export default CountryPieChart;