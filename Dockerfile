FROM python:3.9 as builder
COPY ./ /
RUN pip install -r requirements.txt -U -i https://mirror.baidu.com/pypi/simple &&\
    pip uninstall opencv-python-headless opencv-python -y && pip install opencv-python-headless==4.5.3.56 -U -i https://mirror.baidu.com/pypi/simple


# Here is the production image
FROM python:3.9-slim as app
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=builder /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
COPY --from=builder /server.py /
COPY --from=builder /entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENV FLASK_APP_PATH=${work_dir}/server.py
ENV FLASK_PORT=5000
WORKDIR /
ENTRYPOINT [ "/entrypoint.sh" ]