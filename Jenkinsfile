@Library('shared-lib') _

pipeline {
    agent any

    environment {
        IMAGE_NAME = "artech0203/node-project"
    }

    stages {

        stage('Generate Image Tag') {
            steps {
                script {
                    generateImageTag()
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    buildDockerImage(
                        IMAGE_NAME
                    )
                }
            }
        }

        stage('DockerHub Login') {
            steps {
                script {
                    dockerHubLogin()
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                script {
                    pushImage(
                        IMAGE_NAME
                    )
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    deployContainer()
                }
            }
        }

        stage('Validate Deployment') {
            steps {
                script {
                    validateDeployment(
                        "http://192.168.1.45:3000"
                    )
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed.'
        }
    }
}