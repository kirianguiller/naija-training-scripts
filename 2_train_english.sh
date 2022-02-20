source ../BertForDeprel/venv/bin/activate

# create project directory
mkdir english_from_scratch_20220218/
# create conllu folder
(cd english_from_scratch_20220218/ && mkdir conllus/ )
# download train and test conllu
gdown --id 1rRhnnqz1U2vrGS0dOzqjbNjHCehEez2l  -O all_naija_gold.conllu # all_naija_gold.conllu
gdown --id 108KbxMVv0XTnUXZpS9dWoTBUkCKWRn3F  -O all_treebanks_english.conllu # all_treebanks_english.conllu
# move these conllu to the conllu folder
mv *.conllu english_from_scratch_20220218/conllus/ && ls english_from_scratch_20220218/conllus 


python ../BertForDeprel/BertForDeprel/preprocessing/1_compute_annotation_schema.py --input_folder english_from_scratch_20220218/conllus --output_path english_from_scratch_20220218/annotation_schema.json


python ../BertForDeprel/BertForDeprel/run.py train --epochs 50 --folder english_from_scratch_20220218/ --ftrain english_from_scratch_20220218/conllus/all_treebanks_english.conllu --model english_from_scratch_20220218_1.pt --batch 32 --bert_type bert-base-multilingual-cased --gpu_ids 0
