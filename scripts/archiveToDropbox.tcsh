#! /bin/tcsh -f

set rootDir = '/Users/andy/Dropbox/DevelopmentTools/MacMini'
set currentDate = `date "+%Y%m%dT%H%M%S"`
set destinationDir = "${rootDir}_${currentDate}"
mkdir "${destinationDir}"

set vimDir = "${destinationDir}/vim"
mkdir "${vimDir}"
cp ~/.vimrc "${vimDir}"
cp ~/.gvimrc "${vimDir}"
ls -a1 "${vimDir}"

set shellDir = "${destinationDir}/shell"
mkdir "${shellDir}"
cp ~/.tcshrc "${shellDir}"
cp ~/.profile "${shellDir}"
cp ~/.bash_profile "${shellDir}"
cp ~/.bashrc "${shellDir}"
ls -a1 "${shellDir}"

set gitDir = "${destinationDir}/git"
mkdir "${gitDir}"
cp ~/.gitconfig "${gitDir}"
ls -a1 "${gitDir}"

set binDir = "${destinationDir}/bin"
mkdir "${binDir}"
cp ~/bin/* "${binDir}"
ls -a1 "${binDir}"

set devDir = "${destinationDir}/dev"
mkdir "${devDir}"
#cp ~/dev/
ls -a1 "${binDir}"
