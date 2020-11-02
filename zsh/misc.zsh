function blog {
cd
if [ ! -d writing ] ; then
git clone git@github.com:kemitchell/writing.kemitchell.com writing
fi
cd writing
vim
}

export HTML_TIDY_FLAGS="-indent --indent-spaces 2 -quiet --tidy-mark no --wrap 0"
