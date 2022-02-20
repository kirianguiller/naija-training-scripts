source ../BertForDeprel/venv/bin/activate

# create project directory
mkdir naija_from_english_20220218/
# create conllu folder
(cd naija_from_english_20220218/ && mkdir conllus/ )
# download train and test conllu
gdown --id 1rRhnnqz1U2vrGS0dOzqjbNjHCehEez2l  -O all_naija_gold.conllu # all_naija_gold.conllu
gdown --id 108KbxMVv0XTnUXZpS9dWoTBUkCKWRn3F  -O all_treebanks_english.conllu # all_treebanks_english.conllu
# move these conllu to the conllu folder
mv *.conllu naija_from_english_20220218/conllus/ && ls naija_from_english_20220218/conllus 

# take the pretrained model from english
mkdir ./naija_from_english_20220218/models

# copy annotation_schema
cp ./english_from_scratch_20220218/annotation_schema.json ./naija_from_english_20220218/

# train the model
python ../BertForDeprel/BertForDeprel/run.py train --folder naija_from_english_20220218/ --epochs 50 --ftrain naija_from_english_20220218/conllus/all_naija_gold.conllu --model naija_from_english_20220218_1.pt --batch 32 --fpretrain english_from_scratch_20220218/models/english_from_scratch_20220218_1.pt --gpu_ids 0
