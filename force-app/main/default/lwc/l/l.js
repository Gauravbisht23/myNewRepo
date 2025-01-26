import { LightningElement } from 'lwc';

export default class L extends LightningElement {
  greeting = 'World';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}