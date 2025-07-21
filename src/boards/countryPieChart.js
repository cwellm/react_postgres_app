import 'devextreme/dist/css/dx.light.css';
import "./analyticsDashboard.scss";

import {API_URL} from "../config/config";

import React, {useState, useEffect} from 'react';
import PieChart, {Label, Series, Tooltip, Legend} from 'devextreme-react/pie-chart';

async function fetchCountryAnalyticsData(){
    return fetch(`${API_URL}/rpc/get_total_country_analytics_data`, {
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
    useEffect(() => {
        const loadCountryAnalyticsData = async () => {
            let countryAnalyticsData_ = await fetchCountryAnalyticsData();
            setCountryAnalyticsData(countryAnalyticsData_);
        }
        loadCountryAnalyticsData();
    }, []);

    return (
        <div id="country-pie-chart">
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
            <Legend
                orientation="vertical"
                itemTextPosition="right"
                horizontalAlignment="right"
                verticalAlignment="top"
                margin={0}
                columnCount={2} />
        </PieChart>
        </div>
    );
}

function customizeTooltip(pointInfo) {
    return {text: pointInfo.argument};
}

export default CountryPieChart;