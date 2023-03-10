# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.6

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# create root directory for our project in the container
RUN mkdir /app

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

CMD ["/bin/bash", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"] 

# To run with docker directly
# docker run \
# --name <name> \
# -p port:port <image> \
# /bin/bash -c "python manage.py makemigrations \
# && python manage.py migrate \
# && python manage.py runserver 0.0.0.0:8000"