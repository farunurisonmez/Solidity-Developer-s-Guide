//1. Enter solidity version here
pragma solidity >=0.5.0 <0.6.0;


//2. Create contract here

contract Struct {
    
    struct Product {
        uint _id;
        string _name;
        string _description;
        uint _price;
        uint _stockAmount;
   }
   
   Product product;

   function setProduct() public {
      product = Product(0,'Asus','ROG 5', 2500, 3);
   }
   
   function get_id() public view returns (uint) {
      return product._id;
   }
   
   function get_name() public view returns (string memory){
       return product._name;
   }
   
   function get_description() public view returns (string memory){
       return product._description;
   }
   
   function get_price() public view returns (uint){
       return product._price;
   }
   
   function get_stockAmount() public view returns (uint){
       return product._stockAmount;
   }
}