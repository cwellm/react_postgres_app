import React, {useEffect, useState, useMemo} from 'react';
import { useNavigate } from 'react-router';

import 'devextreme/dist/css/dx.light.css';
import Button from 'devextreme-react/button';

export default function FormContainer({childForm}) {
    const navigate = useNavigate();
    return <div className="mainFormContainer">
        <Button
            text="Address Overview"
            onClick={() => {
                navigate("/");
            }}
            stylingMode="contained"
            icon="isblank"
        />
        <div className="formContainerForm">
            {childForm}
        </div>
    </div>
}