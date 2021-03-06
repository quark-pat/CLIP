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
#Group ID (Vulid): V-22440
#Group Title: GEN004410
#Rule ID: SV-26689r1_rule
#Severity: CAT II
#Rule Version (STIG-ID): GEN004410
#Rule Title: Files executed through a mail aliases file must be group-owned by root, bin, sys, or system, and must reside within a directory group-owned by root, bin, sys, or system.
#
#Vulnerability Discussion: If a file executed through a mail aliases file is not group-owned by root or a system group, it may be subject to unauthorized modification. Unauthorized modification of files executed through aliases may allow unauthorized users to attain root privileges.
#
#Responsibility: System Administrator
#IAControls: ECLP-1
#
#Check Content: 
#Examine the contents of the /etc/aliases file.
#
#Procedure:
# more /etc/aliases
#Examine the aliases file for any directories or paths that may be utilized
#
# ls -lL <file referenced from aliases>
#Check the permissions for any paths referenced.
#If the group owner of any file is not root, bin, sys, or system, this is a finding.
#
#Fix Text: Change the group ownership of the file referenced from /etc/mail/aliases.
#
#Procedure:
# chgrp root <file referenced from aliases>   
#######################DISA INFORMATION###############################

#Global Variables#
PDI=GEN004410

#Start-Lockdown
