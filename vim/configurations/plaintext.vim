fu! PlainText()
  setlocal cpo+=J
  setlocal fo+=anl
  setlocal tw=60
  setlocal spell
endfu

fu! HighlightPronouns()
	highlight Pronouns ctermfg=green
	match Pronouns /\<I\>\|\<me\>\|\<my\>\|\<mine\>\|\<myself\>\|\<you\>\|\<you\>\|\<your\>\|\<yours\>\|\<yourself\>\|\<he\>\|\<him\>\|\<his\>\|\<his\>\|\<himself\>\|\<she\>\|\<her\>\|\<her\>\|\<hers\>\|\<herself\>\|\<it\>\|\<it\>\|\<its\>\|\<its\>\|\<itself\>\|\<we\>\|\<us\>\|\<our\>\|\<ours\>\|\<ourselves\>\|\<you\>\|\<you\>\|\<your\>\|\<yours\>\|\<yourselves\>\|\<they\>\|\<them\>\|\<their\>\|\<theirs\>\|\<themselves\>/
endfu
