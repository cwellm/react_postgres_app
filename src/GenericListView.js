import GenericListItem from "./GenericListItem";
import "./ListView.css"
import {useEffect, useState} from "react";

function GenericListView(props) {
    /**
     * expected props:
     * fetchData: promise
     * structureInput: function that returns list of structured data
     * itemListRefreshKey: number
     * onDeleteItem: function
     */
    const [data, setData] = useState(null);
    const [refreshTrigger, setRefreshTrigger] = useState(0);
    useEffect( () => {
        /*TODO: make fetchData a prop, call it then via props.fetchData()*/
        props.fetchData().then((responseData) => {
                setData(responseData);
                //setData((data) => data.map(item => ({...item,"links": ["https://google.de"]})));
        }).catch((err) => {
            console.error('Fetch error:', err);
            alert ("Error");
            //setError(err);
            //setLoading(false);
        }); }, [refreshTrigger, props.itemListRefreshKey]);
        const structuredInput = props.structureInput(data);
        const handleDeleteItem = (itemId) => {
            props.onDeleteItem(itemId);
            setRefreshTrigger(refreshTrigger + 1);
        }
        return (
            <div className="generic-list-view" onClick={(e) => {
                //alert("Clicked!");
            }}>
                {structuredInput.map((item) => (
                        <GenericListItem
                            title={item.title}
                            details={item.details}
                            links={item.links}
                            hiddenDetails={item.hiddenDetails}
                            onModify={(e) => {
                                alert("Modify!");
                                e.stopPropagation();
                            }}
                            onDelete={handleDeleteItem}
                        />
                    )
                )
                }
                <div className="Test">

                </div>
            </div>
        );
}

export default GenericListView;