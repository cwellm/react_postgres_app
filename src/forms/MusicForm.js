import React, {useEffect, useState, useMemo} from 'react';
import './FormPage.css';
import { useNavigate } from 'react-router';

async function fetchAllCountryCodes() {
    return fetch('http://localhost:3001/rpc/get_all_country_codes_iso3', {
        method: 'GET',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
        },
    }).then(res => {
        if (res.status !== 200) return null;
        return res.json();
    }).catch((err) => {
        alert(`Error fetching country codes: ${err}`);
        return null;
    });
}

function validateFormData(formData, countrySuggestions) {
    return true;
    if (!("country" in formData)) {
        alert("Country not found in form data");
        return false;
        // throw Error("Country not found in form data");
    }
    if (!(countrySuggestions.includes(formData.country))) {
        alert(`Please provide a valid country code. You got ${formData.country} but may be ${countrySuggestions}`);
        return false;
        // throw Error("Please enter a valid country code!");
    }
    return true;
}

export default function MusicForm() {
    const navigate = useNavigate();
    const [formData, setFormData] = useState({
        interpreter: '',
        musical_piece_name: '',
        music_link: '',
    });

    const handleChangeDefault = (e) => {
        const { name, value } = e.target;
        setFormData((prev) => ({ ...prev, [name]: value }));
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        const mayBeSubmitted = validateFormData(formData);
        if (!mayBeSubmitted) {
            return;
        }
        e.preventDefault();
        fetch('http://localhost:3001/rpc/add_music', {
            method: 'POST',
            headers: {
                Accept: 'application/json',
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        }).then(
            (res) => {
                if (res.status === 204) return null; // No content
                return res.json();
            }
        ).then(
            (data) => {
                if (data?.code === "23503") {
                    throw Error(`Validation failed on server side. Reason: ${data.details}`)
                }
                alert("Data submitted successfully.");
                navigate("/");
            }
        ).catch((err) => {
            alert(`Error on submitting data. Aborting. Reason: ${err}`);
        });
    };

    return (
        <div className="form-page">
            <h2>New Entry</h2>
            <form onSubmit={handleSubmit} className="form">
                <label>
                    Interpreter
                    <input
                        type="text"
                        name="interpreter"
                        required
                        value={formData.firstName}
                        onChange={handleChangeDefault}
                        className="required_input"
                        pattern="(.){3,}"
                        title="Interpreter must be of length at least 3."
                    />
                </label>

                <label>
                    Piece
                    <input
                        type="text"
                        name="musical_piece_name"
                        required
                        value={formData.lastName}
                        onChange={handleChangeDefault}
                        className="required_input"
                        pattern="(.){3,}"
                        title="Piece must be of length at least 3."
                    />
                </label>

                <label>
                    Link
                    <input
                        type="text"
                        name="music_link"
                        required
                        value={formData.lastName}
                        onChange={handleChangeDefault}
                        className="required_input"
                        pattern="^https://.*"
                        title="The link must start with 'https://'"
                    />
                </label>

                <button type="submit">Submit</button>
            </form>
        </div>
    );
}