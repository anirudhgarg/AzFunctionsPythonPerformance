# To enable ssh & remote debugging on app service change the base image to the one below
# FROM mcr.microsoft.com/azure-functions/python:3.0-python3.7-appservice
FROM onlyloggingremoved:1.0.0

RUN cd /azure-functions-host/workers/python/3.6 && \
#     # sed -i 's/import\ inspect/import\ inspect\nimport\ multiprocessing\n/g' OSX/X64/azure_functions_worker/dispatcher.py && \
#     # sed -i 's/import\ inspect/import\ inspect\nimport\ multiprocessing\n/g' LINUX/X64/azure_functions_worker/dispatcher.py && \
    sed -i 's/max_workers=1/max_workers=None/g' OSX/X64/azure_functions_worker/dispatcher.py && \
    sed -i 's/max_workers=1/max_workers=None/g' LINUX/X64/azure_functions_worker/dispatcher.py

RUN cd /azure-functions-host/workers/python/3.7 && \
#     # sed -i 's/import\ inspect/import\ inspect\nimport\ multiprocessing\n/g' OSX/X64/azure_functions_worker/dispatcher.py && \
#     # sed -i 's/import\ inspect/import\ inspect\nimport\ multiprocessing\n/g' LINUX/X64/azure_functions_worker/dispatcher.py && \
    sed -i 's/max_workers=1/max_workers=None/g' OSX/X64/azure_functions_worker/dispatcher.py && \
    sed -i 's/max_workers=1/max_workers=None/g' LINUX/X64/azure_functions_worker/dispatcher.py

RUN cd /azure-functions-host/workers/python/3.8 && \
#     # sed -i 's/import\ inspect/import\ inspect\nimport\ multiprocessing\n/g' OSX/X64/azure_functions_worker/dispatcher.py && \
#     # sed -i 's/import\ inspect/import\ inspect\nimport\ multiprocessing\n/g' LINUX/X64/azure_functions_worker/dispatcher.py && \
    sed -i 's/max_workers=1/max_workers=None/g' OSX/X64/azure_functions_worker/dispatcher.py && \
    sed -i 's/max_workers=1/max_workers=None/g' LINUX/X64/azure_functions_worker/dispatcher.py

# RUN cd /azure-functions-host/workers/python/3.6 && \
# sed -i 's/^.*logger.info.*$//' OSX/X64/azure_functions_worker/dispatcher.py && \
# sed -i 's/^.*logger.info.*$//' LINUX/X64/azure_functions_worker/dispatcher.py

# RUN cd /azure-functions-host/workers/python/3.7 && \
# sed -i 's/^.*logger.info.*$//' OSX/X64/azure_functions_worker/dispatcher.py && \
# sed -i 's/^.*logger.info.*$//' LINUX/X64/azure_functions_worker/dispatcher.py

# RUN cd /azure-functions-host/workers/python/3.8 && \
# sed -i 's/^.*logger.info.*$//' OSX/X64/azure_functions_worker/dispatcher.py && \
# sed -i 's/^.*logger.info.*$//' LINUX/X64/azure_functions_worker/dispatcher.py


ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true \
    FUNCTIONS_WORKER_PROCESS_COUNT=1

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY . /home/site/wwwroot

CMD [ "/azure-functions-host/Microsoft.Azure.WebJobs.Script.WebHost" ]


# docker build --tag azfuncperf-wrk4-stp-1:1.0.0 .
# docker build --tag azfuncperf-wrk2-stp-1:1.0.0 .
# docker build --tag pywinder-wrk1-stp-1:1.0.0 .

# docker build --tag azfuncperf-wrk4-stp-2np1:1.0.0 .
# docker build --tag azfuncperf-wrk2-stp-2np1:1.0.0 .
# docker build --tag azfuncperf-wrk1-stp-2np1:1.0.0 .

# docker build --tag azfuncperf-wrk4-stp-none:1.0.0 .
# docker build --tag azfuncperf-wrk2-stp-none:1.0.0 .
# docker build --tag azfuncperf-wrk1-stp-none:1.0.0 .