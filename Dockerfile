#  this is the base python image to build my custom image from
FROM python:3.12.12-slim-bookworm

# I have to create a directory for the dockerfile
WORKDIR /app

# copy the requirements.txt file to the dockerfile directory
COPY requirements.txt .

# install the application dependencies found in the requirement.txt file
RUN pip install --no-cache-dir -r requirements.txt

# copy the app folder to the working directory
COPY ./app ./app

#expose the port specified - 8501
EXPOSE 8501

# run the application with a set container's entrypoint
CMD ["streamlit", "run", "app/data_process_db.py"]