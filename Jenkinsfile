pipeline {
    agent any
    environment {
         DOCKER_TAG = "0.1"
         DOCKERHUB_CREDENTIALS = credentials('bhagyasri-dockerhub')   
    }
    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository containing your code
                git 'https://github.com/NalamBhagyasri/python-app' , branch: 'master'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build Docker image using Dockerfile
                sh 'docker build -t pyapp:${DOCKER_TAG} .'
            }
        }
        stage('login to Docker') {
            steps {
                // Push Docker image to Docker repository (e.g., Docker Hub)
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            } 
        }
        stage('push image') {
            steps {
                // Deploy Docker container using Docker Compose
                sh 'docker push pyapp:${DOCKER_TAG}'
            }
        }
    }
}
