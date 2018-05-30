FROM python:3.6.5-stretch

WORKDIR /notebooks

ADD . /notebooks

# Add proxy environment variables for pip.
ENV http_proxy http://10.129.250.100:8080
ENV https_proxy http://10.129.250.100:8080

RUN pip install --upgrade pip
RUN pip install jupyter

EXPOSE 88

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=88", "--allow-root"]