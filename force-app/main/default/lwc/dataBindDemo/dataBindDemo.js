import { LightningElement ,track} from "lwc";
export default class DataBindDemo extends LightningElement {
    FirstName='sample';
    LastName='test';
    phone;
    @track formData={}
    handleClick(event) {
        //a+b 
        // console.log('refs-firstname',this.refs.FirstName.value);
        // console.log('refs-lastname',this.refs.LastName.value);
        // console.log('refs-phone',this.refs.Phone.value);
     for (const key in this.refs) {
       this.formData[key]=this.refs[key].value;
     }
        // let firstName=this.template.querySelector('[data-prop-name="FirstName"]').value;
        // console.log('firstname',firstName);
        // let allValues=this.template.querySelectorAll('[data-prop-name]');
        // allValues.forEach((item)=>{
        //     console.log('item',item.dataset.propName);
        //     console.log('value',item.value);

        //      this.formData[item.dataset.propName]=item.value;
        // })
       // console.log(allValues);
        console.log('firstname',this.formData.FirstName);
        console.log('lastname',this.formData.LastName);
        console.log('phone',this.formData.Phone);

    }
    //lwc:ref
    // handleFirstNameChange(event){
    //     this.firstName=event.target.value
    // }
    // handleLastNameChange(event) {
    //     this.lastName=event.target.value;
    // }
    // handlePhoneChange(event) {
    //     this.phone=event.target.value;
    // }
    handleInputChange(event){
        let name=event.target.name;
        if(name==='FirstName'){
            this.FirstName=event.target.value;
        }
        if(name==='LastName'){
            this.LastName=event.target.value;
        }
        if(name==='Phone'){
            this.phone=event.target.value;
        }
       
    }
     get getFullName(){
        return `${this.FirstName}${this.LastName}`
     }

}