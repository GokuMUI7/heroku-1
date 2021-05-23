wget https://github.com/libDrive/libDrive/releases/download/v1.3.2/libDrive.Server.v1.3.2.tar
tar -xvf libDrive.Server.v1.3.2.tar
pip3 install -r requirements.txt -q --no-cache-dir

gunicorn main:app
