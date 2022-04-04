// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Calculator {
    uint public result;

    struct Citizen {
        address add;
        uint256 balance;
    }

    mapping(address => uint256) public addressToBalance;

    Citizen[] public people;

    function addPerson(address _add, uint256 _balance) public {
        people.push(Citizen({add: _add, balance: _balance}));
        addressToBalance[_add] = _balance;
    }

    function deposit(address _add, uint256 amount) public {
        addressToBalance[_add] = add(addressToBalance[_add], amount);
    }

    function transfer(address _to, address _from, uint256 amount) public {
        addressToBalance[_to] = add(addressToBalance[_to], amount);
        addressToBalance[_from] = sub(addressToBalance[_from], amount);
    }

    function splitBill(address[] memory _addresses, uint256 bill) public{
        uint len = _addresses.length;
        uint split = divide(bill, len);
        for(uint i; i<len; i++){
            addressToBalance[_addresses[i]] = addressToBalance[_addresses[i]] - split;
        }
    }

    function add(uint x, uint y) private returns(uint) {
        result = x + y;
        return result;
    }
    
    function sub(uint x, uint y) private returns(uint){
        result = x - y;
        return result;
    }

    function multiply(uint x, uint y) private {
        result = x * y;
    }

    function divide(uint x, uint y) private returns(uint256) {
        require(y!=0,'Division by zero not possible');
        result = x / y;
        return result;
    }
}
