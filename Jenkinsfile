pipeline {
    agent any
    environment {
         DOCKERHUB_CREDENTIALS = credentials('bhagyasri-dockerhub')
        
    }
    

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository containing your code
                git 'https://github.com/NalamBhagyasri/python-app'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build Docker image using Dockerfile
                sh 'docker build -t pyapp:$BUILD_NUMBER .'
            }
        }
        stage('login to Docker') {
            steps {
                // Push Docker image to Docker repository (e.g., Docker Hub)
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUN_CREDENTIALS_USR --password-stdin'
            } 
        }
        stage('push image') {
            steps {
                // Deploy Docker container using Docker Compose
                sh 'docker push pyapp:$BUILD_NUMBER'
            }
        }
    }
}
