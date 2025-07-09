# Use a standard RunPod PyTorch image as the base
# This tag is verified to be available and will fix the "not found" error.
FROM runpod/pytorch:2.3.1-py3.12-cuda12.1.1-devel-ubuntu22.04

# Set the working directory inside the container
WORKDIR /app

# Install git so we can clone your repository
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone your custom ComfyUI repository from GitHub
RUN git clone https://github.com/zeeshan8126/worker-comfyui.git .

# Install the Python dependencies from your requirements.txt file
RUN pip install --upgrade pip && pip install -r requirements.txt

# Set the entrypoint to run the handler script. This will correctly
# start the ComfyUI server in the background and then the RunPod worker.
CMD ["python", "-u", "handler.py"]
