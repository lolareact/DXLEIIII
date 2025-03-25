import { LightningElement, track } from 'lwc';
import Lwc_gleifSearch from '@salesforce/apex/GleifSearchController.fetchEntity';

export default class LegalEntityLookup extends LightningElement {
    @track lei;
    @track entity;
    @track error;

    handleInput(event) {
        this.lei = event.target.value;
    }

    async handleSearch() {
        try {
            this.entity = await fetchEntity({ lei: this.lei });
            this.error = null;
        } catch (error) {
            this.entity = null;
            this.error = 'Invalid LEI or API error';
        }
    }
}