import React, { useState } from 'react';
import './FormPage.css';
import { useNavigate } from 'react-router';

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

    const handleChangeDefault = (e) => {
        const { name, value } = e.target;
        setFormData((prev) => ({ ...prev, [name]: value }));
    };

    function handleChangeStreet(e) {
        const {name, value} = e.target;
        if (name !== "street") {
            return;
        }
        setFormData({name: value});
        //alert("Changed street.");
    }

    function handleSubmitStreet(e) {
        alert("Now submitting...");
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        fetch('http://localhost:3001/rpc/add_address', {
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
                alert("Data submitted successfully.");
            }
        ).catch((err) => {
            alert("Error on submitting data. Aborting.");
        });
        navigate("/");
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
                    />
                </label>

                <label>
                    Country
                    <input
                        type="text"
                        name="country"
                        value={formData.country}
                        onChange={handleChangeDefault}
                    />
                </label>

                <label>
                    E-Mail
                    <input
                        type="email"
                        name="email"
                        value={formData.email}
                        onChange={handleChangeDefault}
                    />
                </label>

                <label>
                    Phone Number
                    <input
                        type="text"
                        name="telephone"
                        value={formData.telephone}
                        onChange={handleChangeDefault}
                    />
                </label>

                <button type="submit">Submit</button>
            </form>
        </div>
    );
}