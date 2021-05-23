// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract MyErcToken {

    string public constant name = "MyErcToken";
    string public constant symbol = "MET";
    uint8 public decimals = 18;
    
    uint public totalSupply;
    
    mapping (address => uint) balances;
    mapping (address => mapping(address => uint)) allowed;

    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _from, address indexed _to, uint _value);

    function balanceOf(address _owner) public view returns(uint){
        return balances[_owner];
    }
    
    function allowance(address _owner, address _spender) public view returns(uint){
        return allowed[_owner][_spender];
    }
    
    function transfer(address _to, uint _value) public{
        require(balances[msg.sender] == _value && balances[_to] + _value >= balances[_to]);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
    }
    
    function transferFrom(address _from, address _to, uint _value) public{
        require(balances[_from] == _value && balances[_to] + _value >= balances[_to] && allowed[_from][msg.sender] >= _value);
        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);

    }
    
    function approve(address _spender, uint _value) public {
       allowed[msg.sender][_spender] = _value;
       emit Approval(msg.sender, _spender, _value);

    
    }
    
}