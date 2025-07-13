import React, {useEffect, useRef, useState} from 'react';
import {SimpleTickerCard} from './TickerCard';

async function fetchMostFrequentEmailDomain() {
    return fetch('http://localhost:3001/rpc/get_most_frequent_email_domain', {
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

export default function MostFrequentEmailDomain() {
    const [emailData, setEmailData] = useState(null);
    useEffect(() => {
        const loadEmailData = async () => {
            let emailData_ = await fetchMostFrequentEmailDomain();
            setEmailData(emailData_);
        }
        loadEmailData();
    }, []);

    const containerRef = useRef<HTMLDivElement | null>(null);

    useEffect(() => {
        if (!emailData) {return};
        const card = new SimpleTickerCard("Most Frequent Email Domain",  [emailData[0]], "custom-class"); // this returns HTMLDivElement
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
    }, [emailData]);

    return <div className="tickerCardParent" ref={containerRef}></div>;
}