# avital_land


docker build and config for the avital_land








docker exec -it <mycontainer>  bash
docker images ls
docker container ls
docker container kill <mycontainer> 
docker system prune -a	
	

docker build -t tensorflow .
docker run --name tensorflow -p 8888:8888 -d tensorflow


docker cp .\pycocotools\ <mycontainer>:/tensorflow1/models/research
docker cp .\faster_rcnn_inception_v2_coco_2018_01_28\ <mycontainer>:/tensorflow1/models/research/object_detection/
docker cp .\TensorFlow-Object-Detection-API-Tutorial-Train-Multiple-Objects-Windows-10-master <mycontainer>:/tensorflow1/models/research/object_detection/elik/



cd models/research
$ export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim 
$ python setup.py build
$ python setup.py install
$ python slim/setup.py build
$ python slim/setup.py install



object_detection> python xml_to_csv.py
python generate_tfrecord.py --csv_input=images/train_labels.csv --image_dir=images/train --output_path=train.record
python generate_tfrecord.py --csv_input=images/test_labels.csv --image_dir=images/test --output_path=test.record

python train.py --logtostderr --train_dir=training/ --pipeline_config_path=training/faster_rcnn_inception_v2_pets.config
