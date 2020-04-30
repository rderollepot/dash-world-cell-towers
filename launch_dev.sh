#!/bin/bash
# Add this directory to PYTHONPATH
export PYTHONPATH=$PYTHONPATH:`dirname "$(realpath $0)"`
dask-scheduler --local-directory work-dir &
dask-worker localhost:8786 --nprocs 8 --local-directory work-dir &
python publish_data.py
python dash_opencellid/app.py
wait
