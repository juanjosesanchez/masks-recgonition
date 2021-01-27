TRAIN=2000

ls *xml  | cut -d '.' -f 1 | shuf |  shuf | shuf | shuf  >  full_set.txt
cat full_set.txt | head -n 335  > ../ImageSets/Main/train.txt
cat full_set.txt | tail -n 62  > ../ImageSets/Main/val.txt
rm -rf full_set.xml
