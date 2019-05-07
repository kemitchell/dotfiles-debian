function blog {
cd
if [ ! -d writing ] ; then
git clone git@github.com:kemitchell/writing.kemitchell.com writing
fi
cd writing
vim
}
