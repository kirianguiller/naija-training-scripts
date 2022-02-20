source ../BertForDeprel/venv/bin/activate


(cd naija_from_english_20220218 && mkdir to_predict)
(cp ../SUD_Naija-NSC/non_gold/* ./naija_from_english_20220218/to_predict)
# predict

python ../BertForDeprel/BertForDeprel/run.py predict --folder ./naija_from_english_20220218  --punct --model ./naija_from_english_20220218/models/naija_from_english_20220218_1.pt --multiple --fpred ./naija_from_english_20220218/to_predict


(cp ./naija_from_english_20220218/predicted/* ../SUD_Naija-NSC/non_gold/)