# To enable ssh & remote debugging on app service change the base image to the one below
# FROM mcr.microsoft.com/azure-functions/python:3.0-python3.7-appservice
# FROM mcr.microsoft.com/azure-functions/python:3.0-python3.7
FROM onlyloggingremoved:1.0.0

RUN cd /azure-functions-host/workers/python/3.6 && \
    sed -i 's/max_workers=1/max_workers=10/g' OSX/X64/azure_functions_worker/dispatcher.py && \
    sed -i 's/max_workers=1/max_workers=10/g' LINUX/X64/azure_functions_worker/dispatcher.py

RUN cd /azure-functions-host/workers/python/3.7 && \
    sed -i 's/max_workers=1/max_workers=10/g' OSX/X64/azure_functions_worker/dispatcher.py && \
    sed -i 's/max_workers=1/max_workers=10/g' LINUX/X64/azure_functions_worker/dispatcher.py

RUN cd /azure-functions-host/workers/python/3.8 && \
    sed -i 's/max_workers=1/max_workers=10/g' OSX/X64/azure_functions_worker/dispatcher.py && \
    sed -i 's/max_workers=1/max_workers=10/g' LINUX/X64/azure_functions_worker/dispatcher.py

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true \
    FUNCTIONS_WORKER_PROCESS_COUNT=1

COPY requirements.txt /
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

COPY . /home/site/wwwroot

CMD [ "/azure-functions-host/Microsoft.Azure.WebJobs.Script.WebHost" ]

# docker build --tag pywinder-wrk1-stp-1:1.0.0 .
# docker run -p 8080:80 --name pywinder-wrk1-stp-1-v1 --cpus=1 --memory=3.5g -it pywinder-wrk1-stp-1:1.0.0

#
# SyncHttpTriggerHtmlParser
# SyncHttpTriggerHelloWorld
# AsyncHttpTriggerHelloWorld
# AsyncHttpTriggerCPUIntensive
# AsyncHttpTriggerCPUIntensiveWithSleeps
# SyncHttpTriggerCPUIntensive
# SyncHttpTriggerWithMixWorkloads
# SyncHttpTriggerCPUIntensiveWithSleeps
# SyncHttpTriggerWithSyncRequests
# AsyncHttpTriggerWithAsyncRequest
# AsyncHttpTriggerWithSyncRequests
# SyncHttpTriggerMemoryIntensive


# vrdmr/pywinder-wrk1-stp-1:1.0.0
# vrdmr/pywinder-wrk4-stp-1:1.0.0
# vrdmr/pywinder-wrk1-stp-none:1.0.0
# vrdmr/pywinder-wrk4-stp-none:1.0.0
# vrdmr/pywinder-wrk1-stp-10:1.0.0
# vrdmr/pywinder-wrk4-stp-10:1.0.0
# vrdmr/pywinder-nologging-wrk1-stp-1:1.0.0
# vrdmr/pywinder-nologging-wrk4-stp-1:1.0.0
# vrdmr/pywinder-nologging-wrk1-stp-10:1.0.0
# vrdmr/pywinder-nologging-wrk4-stp-10:1.0.0