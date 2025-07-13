import React, {useEffect, useRef, useState} from 'react';
import {SimpleTickerCard} from './TickerCard';

import "./TickerCard.scss"

async function fetchMostFrequentPostalFirst() {
    return fetch('http://localhost:3001/rpc/get_most_frequent_first_digit_from_postal_code', {
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

export default function MostFrequentPostalFirstDigit() {
    const [postalData, setPostalData] = useState(null);
    useEffect(() => {
        const loadPostalData = async () => {
            let postalData_ = await fetchMostFrequentPostalFirst();
            setPostalData(postalData_);
        }
        loadPostalData();
    }, []);

    const containerRef = useRef<HTMLDivElement | null>(null);

    useEffect(() => {
        if (!postalData) {return};
        const card = new SimpleTickerCard("Most Frequent Initial Digit In Postal Code",
            [`Digit: ${postalData[0].first_digit}`, `Count: ${postalData[0].cnt}`], "custom-class"); // this returns HTMLDivElement
        const element = card.basicCardDOM();
        if (containerRef.current) {
            containerRef.current.appendChild(element);
        }

        // Optional cleanup in case it needs to be removed later
        return () => {
            if (containerRef.current && containerRef.current.contains(element)) {
                containerRef.current.removeChild(element);
            }
        };
    }, [postalData]);

    return <div className="tickerCardParent" ref={containerRef}></div>;
}