FROM python:3.11

RUN apt-get update && apt-get install -y \
    git \
    gcc \
    python3-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libpq-dev \
    libjpeg-dev \
    zlib1g-dev \
    libffi-dev \
    libssl-dev \
    npm \
    node-less \
    xfonts-75dpi \
    xfonts-base \
    wget

RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.bookworm_amd64.deb

RUN apt install -y ./wkhtmltox_0.12.6.1-3.bookworm_amd64.deb

WORKDIR /opt/odoo

COPY . /opt/odoo

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

CMD ["python3", "/opt/odoo/odoo-bin", "-c", "/etc/odoo/odoo.conf"]
