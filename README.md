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

| Epochs |                          Example 1                           |                          Example 2                           |
| :----: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|   30   | ![output30](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output30.jpg) | ![output30](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output2-30.jpg) |
|   60   | ![output60](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output60.jpg) | ![output60](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output2-60.jpg) |
|   90   | ![output90](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output90.jpg) | ![output90](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output2-90.jpg) |
|  120   | ![output120](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output120.jpg) | ![output120](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output2-120.jpg) |
|  150   | ![output150](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output150.jpg) | ![output150](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output2-150.jpg) |
|  180   | ![output180](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output180.jpg) | ![output180](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output2-180.jpg) |
|  200   | ![output200](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output200.jpg) | ![output200](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output2-200.jpg) |
|  250   | ![output250](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output250.jpg) | ![output250](https://github.com/juanjosesanchez/masks-recgonition/blob/main/examples/output2-250.jpg) |

