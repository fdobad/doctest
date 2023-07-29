        Fire Advanced Analytics & Management
        
                 fire2am QGIS plugin
                
            by fire2a.com research centre

This repo contains a  [QGIS plugin](https://plugins.qgis.org/) for graphically interfacing with [Cell2Fire Scott & Burgan](https://github.com/fire2a/C2FSB) forest fires simulator, test cases and a few extras.  

The softwares enables you to simulate thousand of forest fires on any landscape, provided a fuel raster -with Scott and Burgan fuel types; and [QGIS](https://qgis.org). 

With the bare minimun input being a forest fuels raster. Other spatial inputs can include: an elevation layer; canopies base height, bulk density and fraction cover; also ignition probabilities, weather scenarios, moisture content, protection values, etc.

A cup-of-coffee run length is around a 500x500 sized raster with 50 simulations on a modern laptop. Each fire simulation runs in parallel, though the overall load to the computer can be adjusted via the 'number of threads' parameter (see 'Optional Rules' tab).

Several outputs are available:  
1. Ignition point(s)
2. Fire scars:  
    2.1 Final or every n periods  
    2.2 Animated isochrone  
    2.2 Burn probability map (\>1 simulation)  
3. Spatial statistics:  
   3.1 Flame length  
   3.2 Byram Intensity  
   3.3 Rate of spread  
   3.4 Downstream Protection Value (counting downstream burned cells if no ecological protection value layer is provided)  
   3.5 Betweenness Centrality  
4. Descriptive or numerical statistics (see 'Tables' tab):  
   4.1 from the spatial ones  
   4.2 runtime statistics  
6. Plots (see 'Tables' tab):  
  (WIP)

Spatial outputs are shown and stored as geopackages (*.gpkg) along everything needed for reproducing the simulation(s) experiment.

Currently the FIRE-RES team is working on a firebreak placement feature: Including  landspace clustering (for automatically infering management units) and stochastic network disrupting algorithms! Contact us at: fire2a@fire2a.com!

[Install](#installation) then, choose your guide:
- [User ](readme_user.md)![icon](img/icon.png)
- [Expert ](readme_dev.md)![icon](img/icon_dev.png)

_Most sections have a .gif animation at the end summarizing it._

# Installation
## Overview

1. Install/update QGIS
2. Install the plugin requirements (on QGIS's python environment)  

Using QGIS's plugin manager interface:  

3. Add fire2a plugin repository
4. Install the plugin
  
B. Contingencies  
1. Cell2Fire binary compatibility: See per-platform compiling instructions.  
2. Network access problem to plugin repository: Ask the fire2a team for a zipped release  

## Choose your platform:
- [__Linux__ ](#linux)🗽
- [MacOS ](#linux)🤡
- [Windows ](#windows)💩

## Windows
1. Install or update QGIS, two alternatives:
   
    A. Download & install QGIS from: https://qgis.org/en/site/forusers/download.html#windows  
    or B. Open a terminal, run: `winget install --id OSGeo.QGIS` follow on screen instructions

2. Install the plugin requirements (on qgis's python)

    2.1 Download [requirements.txt](./requirements.txt)  
    2.2 Run "OsGeo4WShell" from the start menu  (Start > type 'osgeo' Enter)  
    2.3 Enter `pip install -r "%USERPROFILE%\Downloads\requirements.txt"` (Modify the path to requirements file if needed)
   
3. Add fire2a's plugin repository:

    3.1 Open QGIS  
    3.2 Menu Bar: Plugins > Manage and Install Plugins... > Settings > Add... (button at the bottom right of Plugin Repositories section)  
    3.2 "Repository details" dialog opens. Fill inputs:  
        "Name": any, though "Fire2a" is suggested  
        "URL" input with "https://fdobad.github.io/qgis-plugin-server/plugins.xml"  
   Confirm (Ok button), repos will be reloaded and a success state should be seen from the fire2a repository

4. Install the plugin

   4.1 On the same "Plugins" dialog, click "All" on the left vertical tab.  
   4.2 Type "fire2am" on the Search...  
   4.2 Select it from the list  
   4.3 Click the install button  

## Windows with a zip

If accessing "https://fdobad.github.io/qgis-plugin-server/plugins.xml" is impossible in your network, you can request a zip file release from the Fire2a team.   
    1. Unzip it  
    2. Inside `fire2am`, double click on `install_windows.bat`  
    3. If a warning dialog rises, dismiss it by clicking on 'More info' > 'Run anyway'.
    4. A terminal windows will rise, and steps 2 and 3 will be done.
   
    - If anything fails, run the `install_debug.bat` and [report back](#windows_debug).

| select package dialog : pip |
| --- |
|<img src="img/win_install_pip.jpg"  alt='cannot load image' height=300px >|
| select package dialog : qgis desktop |
|<img src="img/win_install_qgisdesktop.jpg"  alt='cannot load image' height=300px >|
| extracting zip, clicking installer_windows.bat, avoiding 'windows protected your pc' dialog |
| <img src="img/extract_install.gif" alt='cannot load image' height=400px > |
| 2nd time doesn't complain. Did all outputs looked successful?  |
| <img src="img/win_install_script.gif" alt='cannot load image' height=400px > |

### Windows_debug
If any output looks like a failure message, run `installer_debug.bat` and let us now the output.  
Copy the output from the command prompt window by:  
        1. Selecting the text (left-click then select)  
        2. Copy it by pressing the secondary mouse button (right button)  
        3. Paste it into an email for the fire2a team or [create an issue](https://github.com/fdobad/fire2am-qgis-plugin/issues)  
The installer checks only for these errors: "Qgis Environment failed", "Upgrading pip tools failed" & "Installing python packages failed".  
The most common error is a `ModuleNotFoundError`, after [activation](#activate) meaning something silently failed installing pip packages (this will be automated on QGIS 3.8)  

### Windows_manual 

1. If you do not have pip installed on your system, you will need to install it using the OsGeo4W Setup application. To do this:
    1. Click the 'win' button and type 'osgeo4w-setup'
    2. Launch the application
    3. Select the 'pip' component from the package dialog and install it
2. Once you have pip installed, open the OsGeo console and upgrade pip before installing the plugin requirements:
    1. Click the 'win' button and type 'osgeo4w shell'
    2. Type `pip install --upgrade pip setuptools wheel` and hit enter. If pip fails, try `python3 -m pip --upgrade pip`
    3. Type `pip install -r C:\path\to\fire2am\requirements.txt` and hit enter. Note that in this step you must change 'C:\path\to\fire2am\requirements.txt' for your actual path to '\fire2am\requirements.txt'.
    4. After installing the plugin requirements, move the source folder to QGIS's plugins directory. The path for this directory is `%APPDATA%\QGIS\QGIS3\profiles\default\python\plugins\fire2am.`

Finally, enable the plugin inside QGIS. You can do this by following the instructions in the [Activate the Plugin section.](#activate). 

Take me back to [Windows💩 install instructions](#windows)

## Linux
0. Install QGIS  
    - Debian LTR version: Super Key > type 'QGIS' > Click Install
         - _SQL problems reported on Ubuntu🤡 jammy 22.04 (LTS)_
    - Others: https://qgis.org/en/site/forusers/alldownloads.html#linux
    - MacOS🤡: https://qgis.org/en/site/forusers/download.html#mac
    
1. Donwload a [release](https://github.com/fdobad/fire2am-qgis-plugin/releases) (ask fire2a team for permission to the repo), or get it by email
2. Unzip it into the plugins folder (one level depth)
    ```
    cd ~/Downloads    # probably
    
    # release v>1.0
    unzip fire2am.zip
    mv fire2am/fire2am ~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/
    
    # release v<=1.0
    unzip fire2am.zip -d fire2am
    mv fire2am ~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/
    ```
2. Python requirements  
    Recommended instead: [use a python virtual environment instead](readme_dev.md#venv)
    ```
    cd ~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/fire2am
    pip install --upgrade pip wheel setuptools
    pip install -r requirements.txt
    pip install --upgrade matplotlib
    ```  
    - If failed because `pip: command not found`, then: `sudo apt install python3-pip` (debian)  

3. A Cell2Fire c++ simulator binary is provided, nevertheless compiling it is trivial:  
    ```
    cd ~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/fire2am/C2FSB/Cell2FireC
    sudo apt install g++ libboost-all-dev libeigen3-dev
    make
    ```  
    - If failed: check where your distribution installs eigen (`makefile` assumes `EIGENDIR = /usr/include/eigen3/`)  
    Locate it with `nice find / -readable -type d -name eigen3 2>/dev/null`  
    Then edit `makefile` file, `EIGENDIR = ` line to the found directory & `make` again.  
    
4. If you didn't compile, the binary might not have execution permission:  
   ```
   cd ~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/fire2am/C2FSB/Cell2FireC
   ls -l | grep Cell2Fire # pre check
   chmod u+x Cell2Fire
   ls -l | grep Cell2Fire # post check
   ```

5. [Enable the plugin inside QGIS](#activate)  

## Forcing python requirements in QGIS console
The last resort but very discouraged method to installing packages for the QGIS python environment, inside QGIS:  
1. Launch the [python console](https://docs.qgis.org/2.18/en/docs/user_manual/plugins/python_console.html) by typing `Ctrl+Alt+P` or clicking on the python icon <img src="img/python-logo-only.png"  alt='cannot load image' height=24px >  
2. Write the following commands:  
```
import pip
pip.main(['install', 'my-package-name'])
```
Replace 'my-package-name' and repeat this line with each package from the `requirements.txt` file (inside the zipped folder, [here](https://github.com/fdobad/fire2am-qgis-plugin/blob/main/requirements.txt) or [here](requirements.txt)), (ignore the warnings) and restart QGIS.  

| force pip on python console |
| --- |
|<img src="img/not_recommended_install.gif"  alt='cannot load not_recommended_install' height=400px >|

## Activate
1. QGIS Menu > Plugins > Manage and Install Plugins > All  
2. type 'fire', select 'Fire Simulator Analytics Management'  
3. click 'Install Plugin'  
4. _Optionally install [Plugin Reloader](https://plugins.qgis.org/plugins/plugin_reloader/#plugin-details) to force hard restart the plugin when 🐛bugs🐝🐞 don't go away with the `Restore Defaults` button_  

__Now you have a new icon ![icon](img/icon.png) on the plugin toolbar and a new plugin menu.__  

| activation |
| --- |
|<img src="img/qgis_activate_plugin.gif"  alt='cannot load image' height=400px >|

_Now you have a new icon ![icon](img/icon.png) on the plugin toolbar and a new plugin menu._  

If it fails at this stage, it's probably a `ModuleNotFoundError` meaning something -silently- failed installing pip packages (this will be automated on QGIS 3.8).  
- Check [this section](#forcing-python-requirements-in-qgis-console) for a last resort.  
- Please report the output of `install_debug.bat` to the fire2a team first.  

## Like ⭐ and subscribe to get notified of new releases
<img src="img/like_n_subscribe.gif"  alt='cannot load image' height=300px >

# Broadest Usage Overview  
0. Open & save a qgis project  
1. At least have a fuel raster layer in ascii AAIGrid format, according to Scott & Burgan [fuels definition](spain_lookup_table.csv)  
2. Set project & layers CRS (Coordinate Reference System)  
3. Open the dialog (click on ![icon](img/icon.png)), setup the layers, ignitions, weather on each tab. Click Run!  
4. Wait for the simulation (& postprocessing, although this is done on the background)  
5. Main results will be added as layers (also a folder to reproduce and store all results is made)  

Sample instances are included in the plugin folder `fire2am/C2FSB/data/`  
_Keep reading and then make sure to check the [user guide](readme_user.md)_  

# Screenshot  
![panel_screenshot](img/panel_screenshot.png)  

0. On the Plugin Menu this plugin dialog launcher is shown selected  
1. Its also available on the Plugin Toolbar ![icon](img/icon.png)  
2. Along other very useful plugins -that can be installed directly inside QGIS:  
    - [Plugin Builder](https://plugins.qgis.org/plugins/pluginbuilder3/#plugin-details) : For developers wanting a minimal working plugin template  
    - MUST HAVE! [Plugin Reloader](https://plugins.qgis.org/plugins/plugin_reloader/#plugin-details) : If the plugin provided `Restore Defaults` button doesn't work hard enough, use this  
    - [Time Manager](https://plugins.qgis.org/plugins/timemanager/#plugin-about) : For earlier versions of QGIS (<3.2) this is needed for animating the fire isochrones (merged fire scars evolution layer)  
    - [IPython QGIS Console](http://www.itopen.it/qgis-and-ipython-the-definitive-interactive-console/) : A introspection capable ipython session based on (pip requires) qtconsole  


# Known issues  
- Directories or folders with spaces won't work
- Don't close the current project with the dialogs opened  
- Don't try opening the results directory or geopackage databases (.gpkg) while the simulation is running or while postprocessing  
- Windows version fails around 3564288 cells  

# Keep on reading
- [User guide](readme_user.md)![icon](img/icon.png)
- [Expert guide](readme_dev.md)![icon](img/icon_dev.png)
