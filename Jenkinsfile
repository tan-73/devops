pipeline {
    agent any

    tools {
        maven 'mymaven'
        jdk   'myjdk'
    }

    environment {
        IMAGE_NAME     = "sample-webapp"
        CONTAINER_NAME = "sample-webapp-container"
    }

    stages {
        stage('Clone') {
            steps {
                echo 'Cloning repository'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t sample-webapp .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop sample-webapp-container || true'
                sh 'docker rm   sample-webapp-container || true'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8087:8080 --name sample-webapp-container sample-webapp'
            }
        }
    }
}
