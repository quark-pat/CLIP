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
#
#
#  - Updated by Shannon Mitchell(shannon.mitchell@fusiontechnology-llc.com)
# on 09-Feb-2012 to fix a bug to fix an existing entry if not set to delayed.


#######################DISA INFORMATION###############################
#Group ID (Vulid): V-22488
#Group Title: GEN005539
#Rule ID: SV-26787r1_rule
#Severity: CAT II
#Rule Version (STIG-ID): GEN005539
#Rule Title: The SSH daemon must not allow compression or must only allow compression after successful authentication.
#
#Vulnerability Discussion: If compression is allowed in an SSH connection prior to authentication,
#vulnerabilities in the compression software could result in compromise of the system from an
#unauthenticated connection, potentially with root privileges.
#
#Responsibility: System Administrator
#IAControls: ECSC-1
#
#Check Content: 
#Check the SSH daemon configuration for the Compression setting.
# grep -i Compression /etc/ssh/sshd_config | grep -v '^#'
#If the setting is not present, or set to "yes", this is a finding.
#
#Fix Text: Edit the SSH daemon configuration and add or edit the "Compression" setting value to "no" or "delayed".   
#######################DISA INFORMATION###############################

#Global Variables#
PDI=GEN005539
COMP=$( grep -i Compression /etc/ssh/sshd_config | grep -v '^#' | wc -l )
MODECORRECT=$( grep -i "Compression delayed" /etc/ssh/sshd_config | grep -v '^#' | wc -l )

#Start-Lockdown

#DISA needs to read the man pages...Delayed is the default.

if [ $COMP -eq 0 ]
  then
    echo "#Added for DISA GEN005539" >> /etc/ssh/sshd_config
    echo "Compression delayed" >> /etc/ssh/sshd_config
else
    if [ $MODECORRECT -ne 1 ]
    then
      sed -i 's/Compression.*/Compression delayed/g' /etc/ssh/sshd_config
    fi
fi
