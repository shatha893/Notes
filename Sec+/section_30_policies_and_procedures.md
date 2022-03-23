# Section 30: Policies and Procedures  

## IT Governance   
* Provides a comprehensive security management framework. We do this by using policies, standards, guidlines, procedures.

## Policies  
* Defines the role of security in an organization and establishes the desired end state of the security program.
* Policies are very broad.
* Security policies can be *organizational*, *system specific* or *issue specific*.  

* *Organizational Policies* provide general direction and goals, a framework to meet the business goals, and define the roles, responsibilities, and terms.  

* *System-Specific Policies* address the security needs of a specific technology, application, network, or computer system.  

* *Issue-Specific Policies* are built to address a specific security issue, such as email privacy, emmployee termination procedures, or other specific issues.  

* Policies can be categorized into another 3 categories *regulatory*, *advisory* or *informative*.  

## Standards  
* Are used to implement a policy in an organization.  

## Baseline  
* Def. created as reference points which are documented for use as a method of comparison during an analysis conducted in the future.  

## Guidelines  
* Are used to recommend actions.  

## Procedures  
* Detailed step-by-step instructions that are created to ensure personnel can perform a given action.  

* Most importantly ==> Policies are generic / Procedures are specific.   


## Data Classifications  

* Def. Category based on the value of the organization and the sensitivity of the information if it were to be disclosed.

* Sensitive Data: is any information that can result in a loss of security, or loss of advantage to a company, if accessed by unauthorized persons.  

* Commercial businesses use the following classifications *Public*, *Sensitive*, *Private* and *Confidential*.  

* Public Data: Has no impact to the company if released and is ofter posted in the open-source environment.  

* Sensitive Data: Might have a minimal impact if released.  

* Private Data: Cotnains data that should only be used within the organization.  

* Confidential Data: Highest classification level that contains items such as trade secrets, intellectual property data, source code, and other types that would seriously affect the business if disclosed.   

* Government or military sector uses the following data classifications *Unclassified*, *sensitive but unclassified*, *confidential*, *secret*, and *top secret*.   

* Data Ownership: the process of identifying the person responsible for the confidentiality, integrity, availability, and privacy of information assets.  

* When we're talking about data ownership we don't mean the creators of the data in an enterprise environment there are different roles that fall under this idea which include *data owners*, *data steward* the *data custodian* and the *privacy officer*.  

* Data Owner: a senior (executive) role with ultimate responsibility for maintianing the confidentiality, integrity, and availability of the information asset.
* Data Steward: a role focused on the quality of the data and associated metadata.
* Data Custodian (System Administrator): a role responsible for handling the management of the system on which the data assets are stored.
* Privacy Officer: a role responsible for the oversight of any PII/SPI/PHI assets manged by the company.   

* Who should own the data? someone from the business side.
* IT people should be Data Custodians.  


## PII & PHI  

* Personal Identifiable Information.
* If you're collecting the data it's your responsibility to protect the data collected. 

* PII is a piece of data that can be used either by itself or in combination with some other pieces of data to identify a single person.
* E.g. full name, driver's license, date of birth, place of birth, biometric data, financial account numbers,...etc.  

* Verify with your legal team what is considered PII.  

* PCI DSS (Payment Card Industry Data Security Standard)

## Legal Requirements  

* Any type of information or asset should consider how a compromise of that information can threaten the 3 corse security attributes of the CIA triad.

### Privacy vs Security  
* Security controls focus on the CIA attributes of the prcessing system.
* Privacy: a data governance requirement that arises when collecting and processing personal data to ensure the rights of the subject's data.  
* Legal requirements will affect your corporate governance and policies in regards to privacy of your user's data.  

* GDPR (General Data Protection Regulation):--inside europe-- personal data cannot be collected, processed or retained without the individual's informed consent. It also provides the right for a user to withdraw consent, to inspect, amend, or erase data held about them.  
* GDPR requires data breach notification within 72 hours.
* Data breaches can happen *accidently* or through malicious intereference.  

## Privacy Technologies   
* **Deidentification**: methods and technologies that remove identifying information from data before it is distributed. It's implemented as part of our database design.
* Stuff related to deidentification  
  * Data Masking: a deidentification method where *generic or placeholder labels* are substituted for real data while preserving the structure or format of the original data.  
  * Tokenization: a deidentification method where a *unique token* is substituted for real data.  
  * Aggregation/Banding: a deidentification technique where data is *generalized* to protect the individuals involved.   

* **Reidentification**: an attack that combines a deidentified dataset with other data source to discover how secure the deidentification method used is.   

## Security Policies  
* Privacy policies govern the labeling and handling of data.
* AUP (Acceptable Use Policy): defines the rules that restrict how a computer, netwokr, or other system may be used.
* Change Management Policy: defines the structured way of changing the state of a computer system, network or IT procedure.

* Separation of Duties is a preventative type of administrative controls.  
* Job Rotation: different users are trained to perform the tasks of the same position to help prevent and identify fraud that could occur if only one employee had teh job. 
* Onboarding and Offboarding Policy: dictates what type of things need to be done when an employee is hired, fired or quits.

* Due Diligence: Ensuring that IT infrastructure risks are known and managed properly.  

* Due Care: mitigation actions that an organization takes to defend against the risks that have been uncovered during due diligence.

* Due Process: a legal term that refers to how an organization must respect and safeguard personnel's rights.  


## User Education  

* Security Awareness Training: used to reinforce to users the importance of their help in securing the organization's valuable resources (Best return on Investment).  

* Security Training: used to teach the organization's personnel the skills they need to perform their job in a more secure manner.

* Security education is a generalized training.  


## Vendor Relationships 

### NDA (Non-Disclosure Agreement)  
* Agreement between two parties that defines what data is considered confidential and cannot be shared outside of the relationship. 
* A binding contract.

### MOU (Memorandum of Understanding)  
* A non-binding agreement between two or more organizations to detail an intended common line of action.
* Can be used internally inside one organization but it also can be used between multiple organizations.  

### Service-Level Agreement (SLA)  
* An agreement concerned with the ability to support and respond to problems within a given timeframe and continuing to provide the agreed upon level of service to the user.
* Some contracts have penalties for not meeting your SLAs and some don't.  

### Interconnection Security Agreement (ISA)  
* An agreement for the owners and operators of the IT systems to document what technical requirements each organization must meet.  

### Business Partnership Agreement (BPA)  
* Conducted between two business partners that establishes the conditions of their relationship.
* A BPA can also include security requirements.  

## Disposal Policies  

### Asset Disposal  
* Occurs whenever a system is no longer needed.

### Degaussing  
* Exposes the hard drive to a powerful magnetic field which in turn causes previously-written data to be wiped from the drive.  

### Purging (Sanitizing)  
* Act of removing data in such a way that it cannot be reconstructed using any known forensic techniques.
* Write 0s and 1s on the drive 7 times or more or encrypt the drive and then destroy the encryption key.  

## Clearing  
* Removal of data with a certain amount of assurance that it cannot be reconstructed.

* Data remnants are a big security concern.  

* We should cover 5 steps when discussing disposal policies  
  1. Define which equipment will be disposed of.
  2. Determine a storage location until disposal.
  3. Analyze equipment to determine disposal reuse, resell or destruction.
  4. Sanitize the device and remove all its data.
  5. Throw away, recycle, or resell the device.  

## IT Security Frameworks

* Enterprise security architecture frameworks  
  1. Sherwood Applied Business Security Architecture (SABSA)
     * Is a risk driven architecture.
     * Seeks to consider the security problem by thinking about the what, when, why, who and how of a problem. 
     * We think about this as it intersects with six layers *logical*, *conceptual*, and *contextual layers*.
  2. Control Objectives for Information and Related Technology (COBIT)  
     * A security framework that divides IT into four domains (plan and organize, acquire and implement, deliver and support and monitor and evaluate). 
  3. NIST SP 800-53 is a security control framework developed by the Dept. of Commerce. Each control is placed into 3 categories *technical*, *operational* or *management*.
  4. The ISO 27000 the international framework for information securities standards.  
  5. ITIL (IT Infrastructure library)  
     * The de facto standard for IT service management.   

## Key Frameworks  

### Center for Internet Security (CIS)  
* Def. consensus-developed secure configuration guidelines for hardening (benchmarks) and prespective, prioritized, and simpliefied sets of cybersecurity's best practices (configuration guides).  

### Risk Management Framework (RMF)   
* Def. a process that integrates security and risk management activities into the system develpment life cycle through an approach to security control selection and specification that considers effectiveness, efficiency, and constraints due to applicable laws, directives ,executive orders, policies, standards or regulations.  

### Cybersecurity Framework (CSF)  
* Def. a set of industry standards and best practices created by NIST to help organizations manage cybersecurity risks.  
* Five basic functional area identify, protect, detect, respond and recover.  

### ISO 27001  
* Def. an international standard that details requirements for establishing, implementing, maintaining and continually improving an information security management system (ISMS)   

### ISO 27002  
* Def. an international standard that provides best practice recommendations on information security controls for use by those responsible for initiating, implementing or maintaining information security management systems (ISMS).  

### ISO 27701  
* Def. an international standard that acts as a privacy extension to the ISO 27001 to enhance the existing Information security management system (ISMS) with additional requirements in order to establish, implement, maintain and continually improve a privacy information management system (PIMS).  

### ISO 31000  
* Def. an interntational standard for enterprise risk management that provides a universally recognized paradigm for practitioners and companies employing risk management processes to replace the myriad of existing standards, methodologies and paradigms tha differed between industries, subject matters and regions.  


### System and Organization Controls (SOC)  
* Def. a suite of reports produced during an audit which is used by service organizations to issue validated reports of internal controls over those information systems to the users of those services.  
* There are two types of this.

### Cloud Security Alliance's Cloud Control Matrix  
* Def. designed to provide fundamental security principles to guide cloud vendors and to assist prospective cloud customers in assessing the overall security risk of a cloud provider.

### Cloud Security Alliance's Reference Architecture  
* Def. a methodology and a set of tools that enable security architects, enterprise architects and risk management professionals to leverage a common set of solutions that fulfill their common needs to be able to assess where their internal IT and their cloud providers are in terms of security capabilities and to plan a roadmap to meet he security needs of their business.
