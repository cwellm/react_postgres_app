import 'devextreme/dist/css/dx.light.css';


import React, {useState, useEffect} from 'react';
import PieChart, {Label, Series, Tooltip} from 'devextreme-react/pie-chart';
import Button from 'devextreme-react/button';

import { useNavigate } from 'react-router';

async function fetchCountryAnalyticsData(){
    return fetch('http://localhost:3001/rpc/get_total_country_analytics_data', {
        method: 'GET',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
        },
    }).then(res => {
        if (res.status !== 200) return null;
        return res.json();
    }).catch((err) => {
        alert(`Error fetching country analytics data: ${err}`);
        return null;
    });
}

const customizeText = (countryData) => {
    return countryData.value + " addresses";
}

function CountryPieChart() {
    const [countryAnalyticsData, setCountryAnalyticsData] = useState(null);
    const navigate = useNavigate();

    useEffect(() => {
        const loadCountryAnalyticsData = async () => {
            let countryAnalyticsData_ = await fetchCountryAnalyticsData();
            setCountryAnalyticsData(countryAnalyticsData_);
        }
        loadCountryAnalyticsData();
    }, []);

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
            dataSource={countryAnalyticsData}
            title="Number of Addresses by Country"
        >
            <Series
                argumentField="_name_"
                valueField="_cnt_"
                >
                <Label
                    visible={true}
                    position="outside"
                    customizeText={customizeText}
                />
            </Series>
            <Tooltip
                enabled={true}
                customizeTooltip={customizeTooltip}
            />
        </PieChart>
        </div>
    );
}

function customizeTooltip(pointInfo) {
    return {text: pointInfo.argument};
}

export default CountryPieChart;