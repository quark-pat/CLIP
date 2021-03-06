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
#By Tummy a.k.a Vincent C. Passaro				     #
#Vincent[.]Passaro[@]gmail[.]com	         		     #
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
# on 02-jan-2012 to make the check more pinpointed and make it similar to the
# GEN000540 check.

								     

#######################DISA INFORMATION###############################
#Group ID (Vulid): V-11976
#Group Title: Password Change Every 60 Days
#Rule ID: SV-27129r1_rule
#Severity: CAT II
#Rule Version (STIG-ID): GEN000700
#Rule Title: User passwords must be changed at least every 60 days.
#
#Vulnerability Discussion: Limiting the lifespan of authenticators 
#limits the period of time an unauthorized user has access to the 
#system while using compromised credentials and reduces the period of 
#time available for password-guessing attacks to run against a single 
#password.
#
#Responsibility: System Administrator
#IAControls: IAIA-1, IAIA-2
#
#Check Content: 
#Check the max days field (the 5th field) of /etc/shadow.
# more /etc/shadow
#If the max days field is equal to 0 or greater than 60 for any 
#user, this is a finding.
#
#Fix Text: Set the max days field to 60 for all user accounts.
# passwd -x 60 <user>   
#######################DISA INFORMATION###############################

#Global Variables#
PDI=GEN000700

#Start-Lockdown

WRONGACCOUNTSETTING=`cat /etc/shadow | cut -d ':' -f 1,5|grep -v 60|cut -d ":" -f 1`
#Start-Lockdown

for ACCOUNT in $WRONGACCOUNTSETTING
  do
    passwd -x 60 $ACCOUNT > /dev/null
done

grep '^PASS_MAX_DAYS' /etc/login.defs > /dev/null
if [ $? -eq 0 ]
then
  PASS_MAX_DAYS=`awk '/PASS_MAX_DAYS/{print $2}' /etc/login.defs`
  if [ "$PASS_MAX_DAYS" != "60" ]
  then
    sed -i -e 's/\(PASS_MAX_DAYS[^0-9]*\).*/\160/g' /etc/login.defs
  fi
else
  echo "" >> /etc/login.defs
  echo "# Added for STIG id GEN000700" >> /etc/login.defs
  echo 'PASS_MAX_DAYS   60' >> /etc/login.defs
fi

