source ../BertForDeprel/venv/bin/activate

# create project directory
mkdir naija_from_scratch_20220219/
# create conllu folder
(cd naija_from_scratch_20220219/ && mkdir conllus/ )
# download train and test conllu
gdown --id 1rRhnnqz1U2vrGS0dOzqjbNjHCehEez2l  -O all_naija_gold.conllu # all_naija_gold.conllu
# move these conllu to the conllu folder
mv *.conllu naija_from_scratch_20220219/conllus/ && ls naija_from_scratch_20220219/conllus 

# take the pretrained model from english
mkdir ./naija_from_scratch_20220219/models

# generate annotation
python ../BertForDeprel/BertForDeprel/preprocessing/1_compute_annotation_schema.py --input_folder naija_from_scratch_20220219/conllus --output_path naija_from_scratch_20220219/annotation_schema.json 

# train the model
python ../BertForDeprel/BertForDeprel/run.py train --epochs 50 --folder naija_from_scratch_20220219/ --ftrain naija_from_scratch_20220219/conllus/all_naija_gold.conllu --model naija_from_scratch_20220219_1.pt --batch 32 --bert_type bert-base-multilingual-cased --punct --gpu_ids 0

