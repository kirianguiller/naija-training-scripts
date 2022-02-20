# create project directory
mkdir english_from_scratch/
# create conllu folder
(cd english_from_scratch/ && mkdir conllus/)
# download train and test conllu
gdown --id 1rRhnnqz1U2vrGS0dOzqjbNjHCehEez2l  -O naija_train.conllu # naija_train.conllu
gdown --id 1gIqhBXO-phcH2pdThVFGR9eEkA2b37Dr  -O naija_test.conllu # naija_test.conllu
gdown --id 108KbxMVv0XTnUXZpS9dWoTBUkCKWRn3F  -O all_treebanks_english.conllu # all_treebanks_english
# move these conllu to the conllu folder
mv *.conllu english_from_scratch/conllus/ && ls english_from_scratch/conllus 
