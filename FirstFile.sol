// EHR : Electronic healthcare record Management  

// SPDX-License-Identifier: MIT
pragma solidity 0.8.22; 

 contract EHR{ 
     struct PatientData{ 
         string fullName; 
         uint age; 
         string gender;
         string bloodType ; 
         string allergies;
         string medication; 
         string conditions;
         string immunization;  
         string testResults;
         string hospitalVisits;
         string surgeries;
     } 

     mapping(address=>PatientData)patientData; 

     function addPatientData( string memory _fullName,uint _age,string memory _gender,string memory _allergies,
                            string  memory _bloodType,string memory _medication, string memory _conditions,
                            string memory _immunization,string memory _testResults,string memory _hospitalVisits,
                             string memory _surgeries) public { 
                                patientData[msg.sender].fullName = _fullName; 
                                patientData[msg.sender].age = _age; 
                                patientData[msg.sender].gender = _gender; 
                                patientData[msg.sender].bloodType = _bloodType;
                                patientData[msg.sender].medication = _medication;  
                                patientData[msg.sender].conditions = _conditions;  
                                patientData[msg.sender].immunization = _immunization;
                                patientData[msg.sender].testResults = _testResults; 
                                patientData[msg.sender].hospitalVisits = _hospitalVisits; 
                                patientData[msg.sender].surgeries = _surgeries;  
                                patientData[msg.sender].allergies = _allergies; 
                             } 

                             // function for the data retrival 
    function retrivePatientData() public view returns ( string memory ,uint,string memory,string memory,string memory,
                                                        string memory,string memory, string memory,
                                                        string memory,string memory,string memory) { 
        return (patientData[msg.sender].fullName, patientData[msg.sender].age, 
                patientData[msg.sender].gender, patientData[msg.sender].bloodType, 
                patientData[msg.sender].allergies, patientData[msg.sender].medication, 
                patientData[msg.sender].conditions, patientData[msg.sender].immunization, 
                patientData[msg.sender].testResults, patientData[msg.sender].hospitalVisits, 
                patientData[msg.sender].surgeries);     




                                                        }


      
 }