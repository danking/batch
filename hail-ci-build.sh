set -x

# run the server in the background with in-cluster config
python batch/server.py &

sleep 5

POD_IP='127.0.0.1' BATCH_URL='http://127.0.0.1:5000' python -m unittest test/test_batch.py
EXIT_CODE=$?

exit $EXIT_CODE
