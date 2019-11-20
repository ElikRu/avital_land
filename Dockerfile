FROM "ubuntu:bionic"
RUN apt-get update && yes | apt-get upgrade
RUN mkdir -p /tensorflow/models
RUN apt-get install -y git python-pip
RUN apt-get update && apt-get install -y python3-pip python3-dev && cd /usr/local/bin && ln -s /usr/bin/python3 python && pip3 install --upgrade pip
RUN pip install --upgrade pip
RUN pip install tensorflow==1.4.0
RUN apt-get install -y protobuf-compiler python-pil python-lxml
RUN pip install pillow
RUN pip install lxml
RUN pip install Cython
RUN pip install contextlib2
RUN pip install jupyter
RUN pip install matplotlib
RUN pip install pandas
RUN pip install opencv-python
RUN git clone https://github.com/tensorflow/models.git -b r1.5 --single-branch /tensorflow1/models
WORKDIR /tensorflow1/models/research
RUN protoc object_detection/protos/*.proto --python_out=.
RUN export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py
EXPOSE 8888
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/tensorflow1", "--ip=0.0.0.0", "--port=8888"]
