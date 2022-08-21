#ベースイメージの決定(GPUを使うためのCUDAToolKitイメージ)
FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04
#パッケージのインストール
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    vim
#ディレクトリを移動(ルート権限でのコンフリクトを防止)
WORKDIR /opt
#インストーラをダウンロード
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh && \
    #インストーラの実行
    sh /opt/Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    #インストーラの削除
    rm -f Anaconda3-2019.10-Linux-x86_64.sh

#パスを通す
ENV PATH /opt/anaconda3/bin:$PATH

#pipのアップデート&深層学習パッケージをインストール
RUN pip install --upgrade pip && pip install \
    keras==2.3 \
    scipy==1.4.1 \
    tensorflow-gpu==2.1 \
    protobuf==3.19
#ディレクトリを移動
WORKDIR /
#デフォルトコマンドを指定
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
