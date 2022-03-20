# Section 28: Planning for the Worst  

## Redundancy  
* We plan for the worst by conducting redundancy.
* Redundancy is when we have something extra or unnecessary.
* Redundancy helps ensure *fault-tolerance* to continue operations.  

## Single Point of Failure  
* The individual elements, objects, or parts of a system that would cause the whole system to fail if they were to fail.  

* If we identify Single Points of Failures then we can do redundancy of these to maintain better availability.  

## Redundant Power

### Redundant Power Supply  
* An enclosure that provides two or more complete power supplies.
* Power supplies are a single point of failure which means a redundant power supply mitigates a single point of failure.  
* Issues involved witha power source  
  * Surges: an unexpected increase in the amount of voltage provided.
  * Spikes: A short transient of voltage that can be due to a short circuit, tripped circuit breaker, power outage, or lightning strike.
  * We use a surge protector to protect against a Surge or Spikes.
  * Sags: ar unexpected decrease in the amount of voltage provided.
  * Brownouts: occurs when the voltage drops low enough that it typically causes the lights to dim and can cause a computer to shut off.  
  * Blackouts: occur when there is a total loss of power for a prolonged period.  

## Backup Power  

* Uninterruptible Power Supply (UPS): combines the functionality of a surge protector with that of a battery backup.  
* Backup Generator: an emergency power system used when there's an outage of the regular elecric grid power.
* Three types of backup generators  
  1. Portable gas-engine 
  2. Permanently installed generators.
  3. Battery inverter  

* We also have permenantly installed generators which are more expensive and harder to install. They run on either natural gas, propane or diesel fuel.
* Battery Inverter Generator are super quiet and require very little user interaction. 
* Which one to use?  
  * Depends on how much money our organization wants to spend, how much downtime we can afford and what type of fuel they wanna use.   


## Data Redundancy  

* A RAID (Redundant Array of Independent Disks): Allows the combination of multiple physical hard disks into a single logical hard disk drive that is recognized by the operating system.   
* RAID 0: provides data striping across multiple disks to increase performance.
* RAID 1: provides redundancy by mirroring the data identically on two hard disks.  
* RAID 5: provides redundancy by stripping data and parity data across the disk drives.  
* RAID 6: provides redundancy by stripping and double parity data across the disk drives.  
* RAID 10: creates a stripped RAID of two mirrored RAIDs (combines RAID 1 and RAID 0)   

* When we think of RAIDs they can be categorized as *fault resistant*, *fault tolerant* and *disaster tolerant*.  

* Fault-tolerant RAID: protects against the loss of the array's data if a single component fails (RAID 1, RAID 5, RAID 6)   
* Disaster-tolerant RAID: provides two independent zones with full access to the data (RAID 10)   


## Network Redundancy  

* Focused on ensuring that the network remains up.  
* For network redundancy we can look at it from 3 parts:
  * We need to think about it as the device ( Network interface cards and cables).
  * From the switches and routers prespective to make sure we have redundant paths.
  * You need to think about it from the internet connection to make sure we have redundant paths for that too.  

## Server Redundancy  

* To accomplish server redundancy we use what we call *Cluster* which is 2 or more servers working together to perform a particular job function.  

* We can cluster servers as either *failover* or *load-balancing clusters*.  

* Failover cluster: a secondary server can take over the function when the primary one fails. This is done with Domain controllers and mail servers.  
* Load-balancing Clustering: servers are clustered in order to share resources such as CPU, RAM  and hard disks.   

## Redudant Sites  
* Are categorized into three types  
  1. Hot Sites: a near duplicate of the original site of the organization that can be up and running within minutes.
  2. Warm Sites: a site that has computers, phones, and servers but they might require some configuration before users can start working.
  3. Cold Sites: a site that has tables, chairs, bathrooms and possibly some techinical items like phones and network cabling.


## Data Backup  
* Data backups are essential for disaster recovery. 
* Data backups can be conducted using *Full Backups*, *Incremental Backups* or *differential backups*.  
* Full backup: all of the contents of a drive are backed up. 
* Incremental Backup: only conducts a backup of the contents of a drive that have changed since the last full or incremental backup.
* Differential Backup: only conducts a backup of the contents of a drive that has changed since the last full backup.  

* Differential backups takes more time to create but less time to restore.  

## Tape Rotation  
* It means how long a tape is going to be kept and when it can be overwritten. We have 3 types of tape rotations  
  * 10 Tape Rotation: each tape is ued once per day for two weeks and then the entire set is reused.
  * Grandfather-Father-Son: three sets of backup tapes are defined as the son (daily), the father (weekly), and the grandfather (monthly).
  * Towers of Hanoi: rotation system based on the puzzle with the same name and it consists of three sets of backup tapes (like the grandfather-father-son) that are rotated in a more complex system.
  * Snapshot backup: type of backup primarily used to capture the entire operating system image including all applications and data.  

* Snapshots are commonly used with virtualized systems.  

## Disaster Recovery Planning  
* The development of an organized and in-depth plan for problems that could affect the access of data of the organization's building.  
* A good disaster recovery plan should be written down (DRP).
* An organization should have *Contact Information*, *Impact Determintation*, *Recovery Plan*, *Business Continuity Plan (BCP)*, *Copies of Agreements*, *Disaster Recovery Exercises* and a *List of Critical Systems and Data*.  

## Business Impact Analysis  

* BIA which is a systemtic activity that identifies organizational risks and determines their effect on ongoing, mission critical operations.  
* Business impact analysis is governed by metrics that express system availability. These metrics can be  
  * Maximum Tolerable Downtime: the longest period of time a business can be inoperable without causing irrevocable business failure. MTD.
  * Recovery Time Objective: the length of time it takes after an event to resume normal business operations and activities. RTO
  * Work Recovery Time: the length of time in addition to the RTO of individual systems to perform reintegration and testing of a restored or upgraded system following an even. WRT.
  * Recovery Point Objective: the longest period of time that an organization can tolerate lost data being unrecoverable. RPO.

* Mean time to repair is the average time it takes from system failure to it resuming operation.
* Mean time to failure is the average time it takes from normal operation to failure.
* Mean time between failures  which is the time between failures.