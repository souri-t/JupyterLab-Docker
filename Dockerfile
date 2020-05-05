# python3をベースにする
FROM tensorflow/tensorflow:latest-devel-py3

RUN apt-get update && apt-get install -y \
    curl \
    git \
    tree \
    vim
# RUN pip install --upgrade pip
RUN pip3 install --upgrade pip setuptools
RUN pip3 install jupyterlab
RUN pip3 install matplotlib # デフォルトのTensorflowにはmatplotlibがない！！ <- 実際に遊んでいて初めて気付きました。。
RUN pip3 install opencv-python
RUN pip3 install opencv-contrib-python
RUN jupyter serverextension enable --py jupyterlab

# 作業ディレクトリを指定
WORKDIR /workdir

# コンテナ側のポート番号
EXPOSE 8888

ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

# Jupyterlabのルートとなるディレクトリを指定
CMD ["--notebook-dir=/workdir"]
