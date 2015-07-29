#!/bin/zsh
cd $HOME/.scheduled-mail

for message in `date -I`*.mail(N)
do
	(
		source $message
		mutt -s "$SUBJECT" -- "$TO" <<< "$BODY"
		mv $message $message.sent
	)
done
