pragma solidity ^0.4.11;

/**
 * 				Certification - smart contract
 *		1. contract initializer has admin access.
 *		2. Only admin can add an organisation.
 * 		3. Only an organasation can certify an address(user/student)
 *		4. Organisation cannot add an other organisation. 
 * 		5. Anyone can view the certificate as long as they the student's Unique Identification Number or UIN 		
 */

//includes admin and organization rights and information 
contract certificate {

	address admin;          // user with highest rights/powers

    //data storage using structs
    //organisation information 
    struct organizationInformation{
        string organizationName;
        string organizationDetails;
        address organizationAddress;
    }
    
    //certificate details
    struct certificateDetails{
	    string firstName;
	    string lastName;
	    string certificationIn;
	    string date;
	}
    
    //specific identifier for organization Details
    mapping (address => organizationInformation) organizationInfo;
    
    //specific identifier for certificate Details
    mapping (uint => certificateDetails) certify;

    
	//Constructor(to initialize the admin)
	function certificate () {
		admin = msg.sender;
	}	

	//Modifier to only allow admin to certain sections of code
	//new*
	modifier onlyAdmin() { 
		require(msg.sender == admin);
		_;
	}


     //add organization to list
    function addOrganizations(address _address,
                              string _organizationName,
                              string _organizationDetails) onlyAdmin returns(bool done){
                                  organizationInfo[_address].organizationName = _organizationName;
                                  organizationInfo[_address].organizationDetails = _organizationDetails;
                                  organizationInfo[_address].organizationAddress = _address;
                                  return true;
                              }
                              
                              
    //modifier
	modifier onlyOrganization(){
		require(msg.sender == organizationInfo[msg.sender].organizationAddress);
		_;
	}
	
	//view organization Details
	function organizationInfoDetails(address _address) constant returns(string, string){
	    return(organizationInfo[_address].organizationName, organizationInfo[_address].organizationDetails);
	}

	//terminate the contract(sends all remaining to admin, everything else is removed,
	//only the address remains)
	function kill() onlyAdmin{
		suicide(admin);
	}
	
	//certify student
	function certifyStudents(uint _UIN, 
	                         string _firstName, 
	                         string _lastName,
	                         string _certificationIn,
	                         string _date
	                         )onlyOrganization returns(bool done){
	                           certify[_UIN].firstName = _firstName;
	                           certify[_UIN].lastName = _lastName;
	                           certify[_UIN].certificationIn = _certificationIn; 
	                           certify[_UIN].date = _date;
	                           return true;
	                         }

	
	// view certificate 
	function displayCertificates(uint _UIN) constant returns(string, string, string, string){
	    return(
	            certify[_UIN].firstName,
	            certify[_UIN].lastName,
	            certify[_UIN].certificationIn, 
	            certify[_UIN].date);
	}
}

