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
#Group ID (Vulid): V-22460
#Group Title: GEN005507
#Rule ID: SV-26753r1_rule
#Severity: CAT II
#Rule Version (STIG-ID): GEN005507
#Rule Title: The SSH daemon must be configured to only use message authentication codes (MACs) that employ FIPS 140-2 approved cryptographic hash algorithms.
#
#Vulnerability Discussion: DoD information systems are required to use FIPS 140-2 approved cryptographic hash functions.
#
#Responsibility: System Administrator
#IAControls: DCNR-1
#
#Check Content: 
#Check the SSH daemon configuration for allowed MACs.
#
#Procedure:
# grep -i macs /etc/ssh/sshd_config | grep -v '^#'
#
#If no lines are returned, or the returned MACs list contains any MAC other than "hmac-sha1", this is a finding.
#
#Fix Text: Edit the SSH daemon configuration and remove any MACs other than "hmac-sha1". If necessary, add a "MACs" line.    
#######################DISA INFORMATION###############################

#Global Variables#
PDI=GEN005507

#Start-Lockdown

#This gets addressed in GEN000588
