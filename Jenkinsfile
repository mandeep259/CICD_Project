pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        IMAGE_TAG  = "${BUILD_NUMBER}"
        CONTAINER_NAME = "myapp"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                """
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                sh """
                docker rm -f ${CONTAINER_NAME} || true
                """
            }
        }

        stage('Run Container') {
            steps {
                sh """
                docker run -d --name ${CONTAINER_NAME} ${IMAGE_NAME}:${IMAGE_TAG}
                """
            }
        }

        stage('Smoke Test') {
            steps {
                sh """
                echo "Container logs:"
                docker logs ${CONTAINER_NAME}
                """
            }
        }

        /*
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-hub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh """
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker tag ${IMAGE_NAME}:${IMAGE_TAG} $DOCKER_USER/${IMAGE_NAME}:${IMAGE_TAG}
                    docker push $DOCKER_USER/${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }
        */
    }

    post {
        success {
            echo "✅ Pipeline completed successfully"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
