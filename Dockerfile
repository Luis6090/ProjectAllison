FROM public.ecr.aws/lambda/python:3.13


# Copy function code to the container
COPY ./src/ ./
COPY ./requirements.txt ./

RUN dnf install -y gcc gcc-c++
RUN pip install --upgrade pip

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the command to run the Lambda function
CMD ["handlers.handler_emotion.get_emotion_chain"]
