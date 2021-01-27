# Reconocimiento de mascaras

## Recursos

Se utilizaron los siguientes recursos:

1. El proyecto https://github.com/zzh8829/yolov3-tf2 para crear los tfrecords y entrenar el modelo
2. El proyecto https://github.com/tzutalin/labelImg para etiquetar las imagenes
3. Set de imagenes de https://github.com/cabani/MaskedFace-Net

## Comandos utilizados

``` 
# activar el ambiente
conda activate yolov3-tf2-gpu

# moverse al directorio
cd path\to\yolov3-tf2

# creacion de los tf records
python tools/voc2012.py  --data_dir path\to\VOC2012\ --split train --output_file=path\to\VOC2012\tfrecord\masks_train.tfrecord --classes=path\to\VOC2012\data\voc2012.names 
python tools/voc2012.py  --data_dir path\to\VOC2012\ --split val   --output_file=path\to\VOC2012\tfrecord\masks_val.tfrecord   --classes=path\to\VOC2012\data\voc2012.names 

# entrenamiento del modelo
python train.py --batch_size=8 --dataset path\to\VOC2012\tfrecord\masks_train.tfrecord  --val_dataset path\to\VOC2012\tfrecord\masks_val.tfrecord  --classes=path\to\VOC2012\data\voc2012.names  --weights_num_classes=1 --size=256 --mode=eager_tf --epochs=250

# codigo para probar imagenes
python detect.py --image ./data/mask.jpg --weights ./checkpoints/yolov3_train_7.tf  --classes=path\to\VOC2012\data\voc2012.names

# codigo para probar video
python detect_video.py --weights ./checkpoints/yolov3_train_6.tf
```

## Resultados

| Epochs |                          Example 1                           | Example 2 |
| :----: | :----------------------------------------------------------: | :-------: |
|   15   | ![output15](/Users/juansanchez/wkspaces/masks-recgonition/examples/output15.jpg) |           |
|   68   | ![output68](/Users/juansanchez/wkspaces/masks-recgonition/examples/output68.jpg) |           |
|   75   | ![output75](/Users/juansanchez/wkspaces/masks-recgonition/examples/output75.jpg) |           |
|   90   | ![output90](/Users/juansanchez/wkspaces/masks-recgonition/examples/output90.jpg) |           |
|   99   | ![output99](/Users/juansanchez/wkspaces/masks-recgonition/examples/output99.jpg) |           |

