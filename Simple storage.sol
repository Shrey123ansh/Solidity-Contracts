// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Storage{
    uint favoriteNo;
    
    struct People{
    uint256 favoritenumber;
    string name;
    }

    People[]  people;

    mapping(string=>uint256) nametofavorite;

    function store(uint256 _favoriteNumber) public {
        favoriteNo = _favoriteNumber;
    }
    function retrieve() public view returns(uint){
        return favoriteNo;
    }

    function addmember(string memory _name,uint _favoriteNumber) public {
        people.push(People(_favoriteNumber,_name));
        nametofavorite[_name]= _favoriteNumber;
    }
} 