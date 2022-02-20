source ../BertForDeprel/venv/bin/activate


(cd naija_from_scratch_20220219 && mkdir to_predict)
(cp ../SUD_Naija-NSC/non_gold/* ./naija_from_scratch_20220219/to_predict)
# predict

python ../BertForDeprel/BertForDeprel/run.py predict --folder ./naija_from_scratch_20220219  --punct --model ./naija_from_scratch_20220219/models/naija_from_scratch_20220219_1.pt --multiple --fpred ./naija_from_scratch_20220219/to_predict


(cp ./naija_from_scratch_20220219/predicted/* ../SUD_Naija-NSC/non_gold/)