import React, {useEffect, useState, useMemo} from 'react';
import './FormPage.css';
import { useNavigate } from 'react-router';
import {API_URL} from "../config/config";

async function fetchAllCountryCodes() {
    return fetch(`${API_URL}/rpc/get_all_country_codes_iso3`, {
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

export default function AddressForm() {
    const navigate = useNavigate();
    const [formData, setFormData] = useState({
        firstName: '',
        lastName: '',
        street: '',
        houseNo: '',
        postalCode: '',
        city: '',
        coutry: '',
        email: '',
        telephone: '',
    });
    const [countrySuggestions, setCountrySuggestions] = useState([]);
    const [countryInputValue, setCountryInputValue] = useState('');

    useEffect(() => {
        const loadCountryCodeSuggestions = async () => {
            const countrySuggestions = await fetchAllCountryCodes();
            if (countrySuggestions) setCountrySuggestions(countrySuggestions);
        }
        loadCountryCodeSuggestions();
    }, []);

    // filter based on input
    const filteredCountrySuggestions = useMemo(() => {
        const query = countryInputValue.toLowerCase().trim();
        if (!query) return [];
        return countrySuggestions
            .filter(code => code.toLowerCase().includes(query))
            .slice(0, 20);
    }, [countryInputValue, countrySuggestions]);

    const handleChangeDefault = (e) => {
        const { name, value } = e.target;
        setFormData((prev) => ({ ...prev, [name]: value }));
    };

    function handleCountryInput(event) {
        setCountryInputValue(event.target.value);
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        const mayBeSubmitted = validateFormData(formData, countrySuggestions);
        if (!mayBeSubmitted) {
            return;
        }
        e.preventDefault();
        fetch(`${API_URL}/rpc/add_address`, {
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
        // you could navigate back to list here

/*
curl -X 'POST' \
  'http://127.0.0.1:3001/rpc/add_address' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "firstName": "Ben",
  "lastName": "Baumbach",
  "street": "Fuchsstraße",
  "houseNo": 55,
  "postalCode": "89403",
  "city": "Dresden",
  "email": "ben.baumbach@gmx.de"
}'
 */
    };

    /*
    See also React <input> documentation: https://react.dev/reference/react-dom/components/input#events
     */

    return (
        <div className="form-page">
            <h2>New Entry</h2>
            <form onSubmit={handleSubmit} className="form">
                <label>
                    First Name
                    <input
                        type="text"
                        name="firstName"
                        required
                        value={formData.firstName}
                        onChange={handleChangeDefault}
                        className="required_input"
                    />
                </label>

                <label>
                    Last Name
                    <input
                        type="text"
                        name="lastName"
                        required
                        value={formData.lastName}
                        onChange={handleChangeDefault}
                        className="required_input"
                    />
                </label>

                <label>
                    Street
                    <input
                        type="text"
                        name="street"
                        required
                        value={formData.street}
                        onChange={handleChangeDefault}
                        pattern="([a-zA-Z]{3,}|[a-zA-Z\s]{4,})"
                        className="required_input"
                    />
                </label>

                <label>
                    House Number
                    <input
                        type="text"
                        name="houseNo"
                        required
                        value={formData.houseNo}
                        onChange={handleChangeDefault}
                        className="required_input"
                    />
                </label>

                <label>
                    Postal Code
                    <input
                        type="text"
                        name="postalCode"
                        required
                        value={formData.postalCode}
                        onChange={handleChangeDefault}
                        className="required_input"
                    />
                </label>

                <label>
                    City
                    <input
                        type="text"
                        name="city"
                        required
                        value={formData.city}
                        onChange={handleChangeDefault}
                        className="required_input"
                    />
                </label>

                <label>
                    Country
                    <input
                        type="text"
                        name="country"
                        value={formData.country}
                        onChange={handleChangeDefault}
                        onInput={(event) => handleCountryInput(event)}
                        pattern="[A-Z]{3}"
                        placeholder="3 letter country code"
                        autoComplete="off"
                        className="optional_input"
                    />
                </label>
                {filteredCountrySuggestions.length > 0 && (
                    <div id="countryCodeSuggestionsBox"
                        style={{
                            position: 'inherit',
                            top: '100%',
                            left: 0,
                            right: 0,
                            backgroundColor: 'white',
                            border: '1px solid #ccc',
                            zIndex: 1000,
                            maxHeight: '200px',
                            maxWidth: '200px',
                            overflowY: 'auto',
                        }}
                    >
                        {filteredCountrySuggestions.map((code, index) => (
                            <div
                                key={index}
                                onClick={() => {
                                    setCountryInputValue(code);
                                    formData.country = code;
                                    document.getElementById('countryCodeSuggestionsBox').style.visibility = 'hidden';
                                }}
                                style={{
                                    padding: '8px',
                                    cursor: 'pointer',
                                    borderBottom: '1px solid #eee',
                                }}
                            >
                                {code}
                            </div>
                        ))}
                    </div>
                )}
                <label>
                    E-Mail
                    <input
                        type="email"
                        name="email"
                        value={formData.email}
                        onChange={handleChangeDefault}
                        className="optional_input"
                    />
                </label>

                <label>
                    Phone Number
                    <input
                        type="text"
                        name="telephone"
                        value={formData.telephone}
                        onChange={handleChangeDefault}
                        className="optional_input"
                    />
                </label>

                <button type="submit">Submit</button>
            </form>
        </div>
    );
}