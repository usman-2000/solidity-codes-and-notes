// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// student name
// student roll number
// fees paid or not?

contract School_Management{

    struct Student_Details{
        string name;
        uint256 rollNum;
        bool FeesPaid;
    }
    
    bool FeesPaid = false;

    Student_Details[] public student_List;

    function setStudentName(string memory _name,uint256 _rollNum) public {
        
        student_List.push(Student_Details(_name,_rollNum,FeesPaid));
    }

    function feesPaid(uint256 _RollNumber) public {
        Student_Details storage Fees = student_List[_RollNumber];
        Fees.FeesPaid = !FeesPaid;
    }
}
