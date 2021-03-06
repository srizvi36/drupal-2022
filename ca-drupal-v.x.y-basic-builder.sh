#!/bin/sh

# Linux

 
#Check that argument is provided
if [ $# -eq 0 ]; then
    echo "ca-drupal-v.x.y-basic-builder.sh a Drupal v.x.y install script"
    echo "Drupal v.x.y version argument required"
    echo "Please enter the current Drupal v.x.y Core version number"
    echo "where v is the core verson and x.y are the most recent minor version"
    echo "Example: 9.0.2 is Drupal major core version 9 with minor core of 0.2"
    exit 1
fi

echo " ca-drupal-v.x.y-basic-builder.sh a Drupal v.x.y Install script

    Copyright (C) <2020> <Mike Chase> <https://github.com/mikehchase>

	Codeanywhere Drupal v.x.y Basic Build Script
	
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.  
    "
sleep 5s

echo " INSTRUCTIONS
    (1) Go to Drupal.org - get the latest current Drupal v.x.y CORE version number   
        https://www.drupal.org/project/drupal/releases
        July 2020 Drupal 9.0.2 is Drupal major core version 9 with minor core of .0.2
        
    (2) Logon to your Codeanywhere account 
    
 *  (3) Create a new connection of type PHP - PHP Development stack with Apache, PHP, MySQL, 
        phpMyAdmin and Composer pre-installed 
        We are using a shared Codeanywhere space 
        Please prepend your initials to the connection name 
        Codeanywhere conneciton name is all lower case

    (4) On the container info TAB 
    	 Record the root username on the first line 
    	 [root user without password]
    	 
    (5) From the container info page, select and access and log int phpMyAdmin on another TAB   
     
    (6) Login to phpMyAdmin as root user name and no password    
    
    (7) Select Databases TAB  
       
    (8) Create a database named [your-initials]-drupal-x - where x is a single digit number of the Drupal core version
        - we are using a shared Codeanywhere account, so the database name must be unique    
          
    (9) Open the bash command window and run the following BASH command to make the script executable
        [your-name:/~workspace $] chmod +x ca-drupal-v.x.y-basic-builder.sh 
        
    (11) In the BASH command window run this script
        [your-name:/~workspace $] ./ca-drupal-v.x.y-basic-builder.sh 9.0.2 
        the script will download the Drupal v.x.y core files and establish folders for running the Drupal x install script 
        
    (12) In another TAB Enter the URL of the application over HTTPS - this will start the Drupal site building script 
    
    (13) Fill out the required fields and build your Drupal x site
         (1) use a short all lowercase UNIQUE Drupal x site name - using your initials
         (2) The database (DB) is what you named it in step 8
	     (3) Always set the country and city & check both the update checkboxes 
	        
    (14) This script copies the example.settings.local.php to create the settings.local.php in the sites/default folders
       
    (15) When the build script completes, press the 'Visit your new site link' and record the URL of this site    
"    
sleep 3s

DRUPAL_VERSION_ZIP="drupal-"$1".tar.gz"
DRUPAL_VERSION='drupal-'$1

cd $HOME 

wget https://ftp.drupal.org/files/projects/$DRUPAL_VERSION_ZIP

tar xzvf $DRUPAL_VERSION_ZIP

mv $DRUPAL_VERSION/* workspace/
mv $DRUPAL_VERSION/.htaccess workspace/

cd $HOME/workspace

cd sites/default/
cp default.settings.php settings.php
chmod a+w settings.php
mkdir files
chmod a+w files/

cd $HOME/workspace/sites
cp example.settings.local.php ./default/settings.local.php

sleep 3s

# set the ownership of drupal folders
cd $HOME 
cd $HOME/workspace

sleep 3s

# chown [OPTION]... [OWNER][:[GROUP]] FILE...
# The chown command is used to change the owner and group of files, directories and links. 
# by default, the owner of a filesystem object is the user that created it. 
# The group is a set of users that share the same access permissions (i.e., read, write and execute) for that object.
#
# sudo chown www-data:cabox sites/default
# sudo chown -R www-data:cabox modules
# sudo chown  -R www-data:cabox themes
#
#sudo chown www-data:www-data sites/default
#sudo chown -R www-data:www-data modules
#sudo chown  -R www-data:www-data themes

#sudo chown cabox:cabox sites/default
#sudo chown -R cabox:cabox modules
#sudo chown  -R cabox:cabox themes

echo " DONE Building Drupal $1 Basic CMS site"
