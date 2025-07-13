import React, {useEffect, useState} from 'react';
import { Chart, Series } from 'devextreme-react/chart';
import {useNavigate} from "react-router";

async function fetchLetterCountData(){
    return fetch('http://localhost:3001/rpc/get_name_letter_statistics', {
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

function AddressNameLetterHistogram() {
    const [letterCountData, setLetterCountData] = useState(null);
    useEffect(() => {
        const loadLetterCountData = async () => {
            let letterCountData_ = await fetchLetterCountData();
            setLetterCountData(letterCountData_);
        }
        loadLetterCountData();
    }, []);
    return (
        <Chart id="chart" dataSource={letterCountData}>
            <Series
                valueField="cnt"
                argumentField="letter"
                name="Letter Counts in Address Names"
                type="bar"
                color="#ffaa66" />
        </Chart>
    );
}

export default AddressNameLetterHistogram;