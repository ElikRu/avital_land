# avital_land

	docker build and config for the avital_land

#ref
	main_poj: https://github.com/EdjeElectronics/TensorFlow-Object-Detection-API-Tutorial-Train-Multiple-Objects-Windows-10
	docker: https://towardsdatascience.com/tensorflow-object-detection-with-docker-from-scratch-5e015b639b0b
	raspberry: https://www.youtube.com/watch?v=npZ-8Nj1YwY

#be4 main proj run make sure


$ docker build -t tensorflow .
$ docker run --name tensorflow -p 8888:8888 -d tensorflow

$ docker cp .\faster_rcnn_inception_v2_coco_2018_01_28\ <mycontainer>:/tensorflow1/models/research/object_detection/
$ docker cp .\TensorFlow-Object-Detection-API-Tutorial-Train-Multiple-Objects-Windows-10-master <mycontainer>:/tensorflow1/models/research/object_detection/elik/
	
#move all files from elik to /tensorflow1/models/research/object_detection/
#TODO auto move all files from elik

#edit_file: models/research/object_detection/training/faster_rcnn_inception_v2_pets.config
	#fine_tune_checkpoint -> "/tensorflow1/models/research/object_detection/faster_rcnn_inception_v2_coco_2018_01_28/model.ckpt"
	#input_path -> "/tensorflow1/models/research/object_detection/train.record"
	#label_map_path -> "/tensorflow1/models/research/object_detection/training/labelmap.pbtxt"


$ cd /tensorflow1/models/research
$ export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim 
$ python setup.py build
$ python setup.py install
$ python slim/setup.py build
$ python slim/setup.py install

$cd object_detection
$ python xml_to_csv.py
$ python generate_tfrecord.py --csv_input=images/train_labels.csv --image_dir=images/train --output_path=train.record
$ python generate_tfrecord.py --csv_input=images/test_labels.csv --image_dir=images/test --output_path=test.record

$ python train.py --logtostderr --train_dir=training/ --pipeline_config_path=training/faster_rcnn_inception_v2_pets.config


#run bash
$ docker exec -it <mycontainer>  bash  
	
#del container	
$ docker images ls
$ docker container ls
$ docker container kill <mycontainer> 
$ docker system prune -a	
	





