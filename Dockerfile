FROM nvcr.io/nvidia/pytorch:20.01-py3

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl git build-essential
RUN apt-get install libsndfile1

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

WORKDIR / 
RUN git clone https://github.com/openai/jukebox.git
WORKDIR /jukebox
ADD requirements.txt /jukebox/requirements.txt
RUN pip install -e .

WORKDIR /workspace