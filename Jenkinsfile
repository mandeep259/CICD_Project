pipeline {
  agent any

  environment {
    IMAGE_NAME = "myapp"
    IMAGE_TAG  = "v1"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
      }
    }

    stage('Run Container') {
      steps {
        sh '''
          docker rm -f myapp || true
          docker run -d --name myapp $IMAGE_NAME:$IMAGE_TAG
        '''
      }
    }
  }
}
