import { LightningElement } from 'lwc';
export default class ParentComp extends LightningElement {
 message1;
handleChange(event) {
this.message1 = event.detail.value;
}
}