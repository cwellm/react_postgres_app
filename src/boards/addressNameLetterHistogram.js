import React, {useEffect, useState} from 'react';
import { Chart, Series } from 'devextreme-react/chart';
import {useNavigate} from "react-router";

import {API_URL} from "../config/config";

async function fetchLetterCountData(){
    return fetch(`${API_URL}/rpc/get_name_letter_statistics`, {
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

function AddressNameLetterHistogram(props) {
    const [letterCountData, setLetterCountData] = useState(null);
    useEffect(() => {
        const loadLetterCountData = async () => {
            let letterCountData_ = await fetchLetterCountData();
            setLetterCountData(letterCountData_);
        }
        loadLetterCountData();
    }, []);
    return (
        <Chart dataSource={letterCountData} id={props.id}>
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