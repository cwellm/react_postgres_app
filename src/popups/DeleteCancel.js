import React from "react";
import { useNavigate } from 'react-router';

export default function DeleteCancelOptions({onConfirmDelete, onCancel}) {
    return (
        <div className="DeleteCancelOptions">
            <button className="btn add-btn" onClick={() => {onConfirmDelete();}}>Delete</button>
            <button className="btn add-btn" onClick={() => {onCancel();}}>Cancel</button>
        </div>
    )
}