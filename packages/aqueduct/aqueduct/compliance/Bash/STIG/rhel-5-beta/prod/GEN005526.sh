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
#  - Updated by Shannon Mitchell(shannon.mitchell@fusiontechonlogy-llc.com)
# on 06-Feb-2012 to only run fix when needed.


#######################DISA INFORMATION###############################
#Group ID (Vulid): V-22475
#Group Title: GEN005526
#Rule ID: SV-26768r1_rule
#Severity: CAT III
#Rule Version (STIG-ID): GEN005526
#Rule Title: The SSH daemon must not permit Kerberos authentication unless needed.
#
#Vulnerability Discussion: Kerberos authentication for SSH is often implemented using GSSAPI. 
#If Kerberos is enabled through SSH, the SSH daemon provides a means of access to the system's 
#Kerberos implementation. Vulnerabilities in the system's Kerberos implementation may then be 
#subject to exploitation. To reduce the attack surface of the system, the Kerberos authentication 
#mechanism within SSH must be disabled for systems not using this capability.
#
#
#Responsibility: System Administrator
#IAControls: ECSC-1
#
#Check Content: 
#Ask the SA if Kerberos authentication is used by the system. If it is, this is not applicable.
#
#Check the SSH daemon configuration for the KerberosAuthentication setting.
# grep -i KerberosAuthentication /etc/ssh/sshd_config | grep -v '^#'
#If no lines are returned, or the setting is set to "yes", this is a finding.
#
#Fix Text: Edit the SSH daemon configuration and set (add if necessary) an "KerberosAuthentication" directive set to "no".   
#######################DISA INFORMATION###############################

#Global Variables#
PDI=GEN005526

#Start-Lockdown

if [ `grep -c "^KerberosAuthentication" /etc/ssh/sshd_config` -gt 0 ]
then
  egrep '^KerberosAuthentication.*yes' /etc/ssh/sshd_config > /dev/null
  if [ $? -eq 0 ]
  then
    sed -i "/^KerberosAuthentication/ c\KerberosAuthentication no" /etc/ssh/sshd_config
    service sshd restart
  fi
else
  echo "#Adding for DISA $PDI" >> /etc/ssh/sshd_config
  echo "KerberosAuthentication no" >> /etc/ssh/sshd_config
  service sshd restart
fi
