# certificate Dapp

This decentralized application is used to certify students in various courses offered by organizations.

### The smart contract works with a few basic underlying rules:
  1. Contract Initializer has admin access.
  2. Only admin can add an Organization, i.e. any other account which tries the latter will be declined.
  3. Only a registered organization can certify a student.
  4. Organizations can not add another organization.
  5. Anyone can view the certificate as long as they have the UIN(Unique Identification Number).
  
### Working of the Dapp:
  1. Contract Deployment
      * Use the link to deploy the solidity contract, [solidity](https://remix.ethereum.org/#version=soljson-v0.4.17+commit.bdeb9e52.js)
  2. Add Organization:
      * To add a new organization the user must be logged in as the admin.
      * Three fields necessary for the addition of organisations are:
          * Name of the organization
          * Address of the organization
          * Details of the organization, i.e. the fields in which the courses are offered, year of establishment.
  3. Certifying a Student:
      * To certify a student the user must be logged in as a certified organization.
      * The stated fields must be completed in order to certify a student:
          * UIN or Unique Identification Number (working explained below)
          * First Name
          * Last Name
          * Field of certification
          * Date certified.
  4. View certificate
      * Anyone can view a certificate as long as they have access to the student’s UIN.
      * The certificate should be displayed once the UIN has been entered.
  5. View or Verify organization:
      * Details of any organization can be viewed as long as they have access to the address of the registered organization.
      * An organization can display its address on its website to provide authenticity to the certificate.
      * A signed by feature is always available in the certificate provided, this address can then be used to verify the details of the certifying organization.
 
#### Note: All the above has been tested and tried on the rinkeby test network on google chrome with the extension metamask installed and active.

### UIN (Unique Identification Number):
  1. A student can be identified using an unique identification number with the help of a few classifiers
      * Organization code – ZOO
      * Academic year – YY
      * Course ID – CC
      * Individual number issued in the order of enrolment – XXX
      * E.g. ZOOYYCCXXX
  2. E.g. 1BU17CS111
      * 1BU – Bangalore University
      * 17 – Academic year 2017
      * CS – Course ID for Computer Science
      * 111 – Rakesh Sharma (as per enrolled order)
  3. A few more non-existent certificated have been for added for viewing
      * 1BU17CS111
      * 1RU17IS012
      * 1RU17MD218
      * 1BU17BC105
      * 1RU17BS035

        
