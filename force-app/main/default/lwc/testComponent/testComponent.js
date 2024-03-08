import { LightningElement,track } from 'lwc';


export default class TestComponent extends LightningElement {
    sampleStr='this is js data';
    nameValue;
    emailValue;
    userData={}
count=0;
    a=100;
    b=200;
    @track person={
        name:'sample',
        age:20
    }
    cars=['Benz','Swift','Tesla'];
    students=[
        {sid:1,sname:'raj'},
        {sid:2,sname:'sai'},
        {sid:3,sname:'rupesh'},

    ]
  //this.template.querySelector('');
  //lwc:ref
    handleChange(event){
        console.log(event);
        console.log(event.target.label);
        console.log(event.target.name);
        console.log(event.target.type);
        console.log(event.target.tagName);

 let {name,value} = event.target;
 userData[name]=value;
//  if(name ==='uname'){
//     this.nameValue=value;
//  }
//  if(name ==='email'){
//     this.emailValue=value;
//  }



        let str=event.target.value;
console.log(str);
this.person.name=str;
console.log(this.person);
    }
    handleIncrease(event){
        console.log('increase',event.target);
        this.count++;

    }
    handleDecrease(event){
console.log('decrease',event.target);
this.count--;
    }
}