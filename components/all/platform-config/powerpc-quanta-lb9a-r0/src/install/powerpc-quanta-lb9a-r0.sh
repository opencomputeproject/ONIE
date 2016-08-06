############################################################
# <bsn.cl fy=2013 v=onl>
# 
#        Copyright 2013, 2014 Big Switch Networks, Inc.       
# 
# Licensed under the Eclipse Public License, Version 1.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
# 
#        http://www.eclipse.org/legal/epl-v10.html
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific
# language governing permissions and limitations under the
# License.
# 
# </bsn.cl>
############################################################
############################################################
# 
# Installer scriptlet for the Quanta LB9A. 
#    
# The loader must be written raw to the first partition. 
platform_loader_raw=1
# The bootcommand is to read the loader directly from the first partition and execute it. 
platform_bootcmd='diskboot 0x10000000 0:1 ; setenv bootargs console=$consoledev,$baudrate onl_platform=powerpc-quanta-lb9a-r0; bootm 0x10000000'

platform_installer() {
    # Standard installation on the CF card.
    installer_standard_blockdev_install sda 16M 64M ""
}

