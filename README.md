SmurfMod9 for the EVO 4G

## Info

|||
|-----------------------------------:|:--------------------------|
|**Discussion thread**: | http://forum.xda-developers.com/showthread.php?t=1808358
|**Bug List**:		| http://forum.xda-developers.com/showthread.php?t=1808358

## Building 

### Initialize
[setup linux/OS X](http://source.android.com/source/initializing.html) - Please note: it must be sun-java-6, not openjdk

### Prepare to download sources
```bash
mkdir ~/cm9
cd ~/cm9/
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
chmod a+x ~/bin/repo
repo init -u git://github.com/CyanogenMod/android.git -b ics
```

### Download the source
```bash
repo sync -j16
```
NOTE: This WILL take a long time.

### Finish setting up repo
```bash
wget -O .repo/local_manifest.xml https://raw.github.com/Papa-Smurf151/android_device_htc_supersonic/master/Manifest/local_manifest.xml
```

### Download my sources
```bash
repo sync -j16
```

### Build
Pull in the prebuilts, like Rom Manager...
```bash
./vendor/cm/get-prebuilts
```
And build!
```bash
. build/envsetup.sh && brunch supersonic
```

