#Aqueduct - Compliance Remediation Content
#Copyright (C) 2011,2012  Vincent C. Passaro (vincent.passaro@gmail.com)
#
#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor,
#Boston, MA  02110-1301, USA.

#!/bin/bash
######################################################################
#By Tummy a.k.a Vincent C. Passaro		                     #
#Vincent[.]Passaro[@]gmail[.]com				     #
#www.vincentpassaro.com						     #
######################################################################
#_____________________________________________________________________
#|  Version |   Change Information  |      Author        |    Date    |
#|__________|_______________________|____________________|____________|
#|    1.0   |   Initial Script      | Vincent C. Passaro | 20-oct-2011|
#|	    |   Creation	    |                    |            |
#|__________|_______________________|____________________|____________|
#######################DISA INFORMATION###############################
#Group ID (Vulid): V-993
#Group Title: Changed SNMP Community Strings
#Rule ID: SV-993r7_rule
#Severity: CAT I
#Rule Version (STIG-ID): GEN005300
#Rule Title: SNMP communities, users, and passphrases must be changed 
#from the default.
#
#Vulnerability Discussion: Whether active or not, default SNMP passwords,
#users, and passphrases must be changed to maintain security.
#If the service is running with the default authenticators, then 
#anyone can gather data about the system and the network and use the
#information to potentially compromise the integrity of the system 
#or network(s).
#
#Responsibility: System Administrator
#IAControls: IAAC-1
#
#Check Content: 
#Check the SNMP configuration for default passwords.
#
#Procedure:
#Examine the default install location /etc/snmp/snmpd.conf
#or:
# find / -name snmpd.conf
# more <snmpd.conf file>
#
#Identify any community names or user password configuration. 
#If any community name or password is set to a default value 
#such as
#"public", "private", "snmp-trap", or "password", or any value 
#which does not meet DISA password requirements, this is a finding.
#
#Fix Text: Change the default passwords. To change them, locate
#the file snmpd.conf. Edit the file. Locate the line 
#system-group-read-community which has a default password of 
#public and make the password something more random 
#(less guessable). Do the same for the lines that
#read system-group-write-community, read-community, 
#write-community, trap and trap-community. Read the information 
#in the file carefully.
#The trap is defining who to send traps to, for instance, by 
#default. It is not a password, but the name of a host.   
#######################DISA INFORMATION###############################

#Global Variables#
PDI=GEN005300

#Start-Lockdown

if [ -e /etc/snmp/snmpd.conf ]
  then
	
	sed -i 's/public/sNMp@$$w0rd4D1$A/' /etc/snmp/snmpd.conf
	sed -i 's/private/sNMp@$$w0rd4D1$A/' /etc/snmp/snmpd.conf
	sed -i 's/snmp-trap/sNMp@$$w0rd4D1$A/' /etc/snmp/snmpd.conf
	sed -i 's/password/sNMp@$$w0rd4D1$A/' /etc/snmp/snmpd.conf 
fi



