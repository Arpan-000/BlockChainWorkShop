// CDBMS : College Database Management System
// SPDX-License-Identifier: MIT
pragma solidity 0.8.22; 

contract CDBMS { 
    struct Student { 
        string fullName; 
        string rollNumber; 
        string gender;
        string course;  
        string department; 
        string year;
        string backlogs; //no of backlogs
    } 

    struct Faculty { 
        string fullName; 
        uint facId;
        string facType; //prof or associate prof..etc
        string gender;
        string course; //course currently teaching
        string department; 
    } 

    mapping(address => Student) public students;
    mapping(address => Faculty) public faculties;

    function addStudentData(
        string memory _fullName,
        string memory _rollNumber,
        string memory _gender,
        string memory _course,
        string memory _department,
        string memory _year,
        string memory _backlogs
    ) public { 
                                students[msg.sender].fullName = _fullName; 
                               students[msg.sender].rollNumber = _rollNumber; 
                                students[msg.sender].gender = _gender; 
                                students[msg.sender].course = _course;
                               students[msg.sender].department = _department;  
                               students[msg.sender].year = _year;  
                                students[msg.sender].backlogs = _backlogs;
    }  

    function addFacultyData(
        string memory _fullName,
        uint _facId,
        string memory _facType,
        string memory _gender,
        string memory _course,
        string memory _department
    ) public { 
         faculties[msg.sender].fullName = _fullName; 
                             faculties[msg.sender].facId = _facId; 
                                      faculties[msg.sender].facType = _facType; 
                            faculties[msg.sender].gender = _gender; 
                                faculties[msg.sender].course = _course;
                            faculties[msg.sender].department = _department;  
                
    }

    function getStudentData() public view returns (string memory, string memory, string memory, string memory, string memory, string memory, string memory) {
        
        return ( students[msg.sender].fullName,
                               students[msg.sender].rollNumber,
                                students[msg.sender].gender ,
                                students[msg.sender].course ,
                               students[msg.sender].department ,
                               students[msg.sender].year , 
                                students[msg.sender].backlogs);
    }  

    function getFacultyData() public view returns (string memory, uint, string memory, string memory, string memory, string memory) {
       
        return ( faculties[msg.sender].fullName, faculties[msg.sender].facId,
                                      faculties[msg.sender].facType ,
                            faculties[msg.sender].gender  ,
                                faculties[msg.sender].course,
                            faculties[msg.sender].department 
                );
    }
}