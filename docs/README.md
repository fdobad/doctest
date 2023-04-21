# Cell 2 Fire QGIS plugin

This repo contains a [QGIS](https://qgis.org) [plugin](https://plugins.qgis.org/) for graphically interfacing with Cell2Fire [SB](https://github.com/fire2a/C2FSB) simulator.  
Choose your guide:
- [User](readme_user.md)![icon](img/icon.png)
- [Developer](readme_dev.md)![icon](img/icon_dev.png)

This softwares enables you to simulate thousand of forest fires on a landscape using QGIS. At least you'll need a fuel and elevation layer.

## Installation
### 1. Overview (don't do this)
- pip install python required packages
- move the source folder to QGIS's plugins directory
- activate inside QGIS

### 2. Windows automatic
NOTE: If you already installed QGIS you can do the steps of the overview [manually](windows manual)
0. Install QGIS, using OSGeo4W net installer  
    - https://qgis.org/en/site/forusers/alldownloads.html#osgeo4w-installer  
    - Use default options for everything but
    - Select packages to install "QGIS desktop" & "pip"
1. At least open and close QGIS once
2. Download & un7zip a release (from the [releases](https://github.com/fdobad/fire2am-qgis-plugin/releases) right tab) into `fire2am` (default suggested name)  
3. Inside, double click on `installer_windows.bat`
    - 'More info' on the warning dialog
    - 'Run anyway'
4. [Install the plugin inside QGIS](#activate)

| select package dialog : pip |
| --- |
|<img src="img/win_install_pip.jpg"  alt='cannot load image' height=300px >|
| select package dialog : qgis desktop |
|<img src="img/win_install_qgisdesktop.jpg"  alt='cannot load image' height=300px >|
| extracting zip, clicking installer_windows.bat, avoiding useless 'windows protected your pc' dialog |
| <img src="img/extract_install.gif" alt='cannot load image' height=400px > |
| 2nd time doesn't complain, if something fails run installer_debug.bat and let us know what happened |
| <img src="img/win_install_script.gif" alt='cannot load image' height=400px > |

### Windows manual 
- launch osgeo installer > install pip component
- launch osgeo console > run pip install -r C:\path\to\fire2am\requirements.txt
- move the source folder into QGIS's plugins directory %APPDATA%\QGIS\QGIS3\profiles\default\python\plugins\fire2am
- [Enable the plugin inside QGIS](#activate)

### 3. Linux steps  
0. Install QGIS  
    - Debian LTR version: Super Key > type 'QGIS' > Click Install
    - Others: https://qgis.org/en/site/forusers/alldownloads.html#linux
1. Donwload a release, unzip into the plugins folder `~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/fire2am`
2. `cd` into it  
3. Python requirements  
(Optional) A virtual environment can be used, but you must remember to activate it before launching QGIS, for example `$ source ~/pyenv/qgis/bin/activate && qgis`  
    ```
    pip install --upgrade pip wheel setuptools
    pip install -r requirements.txt
    ```
4. A Cell2Fire c++ simulator binary is provided, but is better to compile it  
    ```
    cd C2FSB/Cell2FireC
    sudo apt install g++ libboost-all-dev libeigen3-dev
    make 
    ```  
    
    If it fails check where your distribution installs eigen. Because the `makefile` assumes `EIGENDIR = /usr/include/eigen3/`  
    Locate it with `nice find / -readable -type d -name eigen3 2>/dev/null`  
    Then edit `makefile` accordingly & try again.  

5. [Enable the plugin inside QGIS](#activate)  

### Like and subscribe to get the latest releases
<img src="img/like_n_subscribe.gif"  alt='cannot load image' height=300px >


### Activate
1. QGIS Menu > Plugins > Manage and Install Plugins > All  
2. type 'fire', select 'Fire Simulator Analytics Management'  
3. click 'Install Plugin'  
Now you have a new icon ![icon](img/icon.png) on the plugin toolbar and a new plugin menu.  

| activation |
| --- |
|<img src="img/qgis_activate_plugin.gif"  alt='cannot load image' height=400px >|

Now you have a new icon ![icon](img/icon.png) on the plugin toolbar and a new plugin menu.  

## Broadest Usage Overview
0. Open & save a qgis project  
1. At least have a fuel raster layer in ascii AAIGrid format, according to Scott & Burgan fuels [definition](spain_lookup_table.csv)  
2. Set project & layers CRS (Coordinate Reference System)  
3. Open the dialog (the plugin icon), setup the layers, ignitions, weather on each tab. Click Run!  
4. Wait for the simulation (& postprocessing, although this is done on the background)
5. Main results will be added as a layer (also a folder to reproduce and store all results is made)  

There are sample instances on the plugin folder `fire2am/C2FSB/data/`
If you are unsure of this steps, keep reading and go to the [user manual](readme_user.md) 

## Screenshot  
![panel_screenshot](img/panel_screenshot.png)  

0. On the Plugin Menu this plugin is shown selected  
1. Its icon is also available on the Plugin Toolbar ![icon](img/icon.png)  
2. Along other very useful plugins:  
    - Plugin Builder : For developers wanting a minimal working plugin template  
    - Plugin Reloader : If the provided Restore Defaults button doesn't work, use this  
    - Time Manager : For earlier versions of QGIS (<3.2) this is needed for animating the fire isochrones (merged fire evolution layer)  
    - IPython QGIS Console : A introspection capable ipython session based on qtconsole  

## Known issues  
- Directories or folders with spaces won't work
- Don't close the current project with the dialogs opened  
- Don't try opening the results directory or geopackage databases (.gpkg) while the simulation is running or while postprocessing  
- Windows version fails around 3564288 cells  

A cup-of-coffee run length is less than 1000x1000 raster with 100 simulations (the load can be adjusted via number of threads on optional rules tab) 

#### Keep on reading:
- [User](readme_user.md)![icon](img/icon.png)
- [Developer](readme_dev.md)![icon](img/icon_dev.png)
