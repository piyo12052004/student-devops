pipeline {
    agent any

    environment {
        APP_NAME = 'laravel-app'
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo 'Mengambil kode dari repository...'

                checkout scm
            }
        }

        stage('Test') {
            steps {
                echo 'Menampilkan directory yang di-checkout...'

                sh '''
                    echo "Current directory:"
                    pwd

                    echo ""
                    echo "Isi directory:"
                    ls -lah
                '''
            }
        }

        stage('Docker Build') {
            steps {
                echo "Build Docker image ${APP_NAME}:${IMAGE_TAG}"

                sh '''
                    docker build \
                        -t ${APP_NAME}:${IMAGE_TAG} \
                        -t ${APP_NAME}:latest \
                        .
                '''
            }
        }

        stage('Docker Image Check') {
            steps {
                echo 'Menampilkan Docker image...'

                sh '''
                    docker images ${APP_NAME}
                '''
            }
        }
    }

    post {

        success {
            echo 'CI berhasil: Checkout dan Docker Build berhasil.'
        }

        failure {
            echo 'Pipeline gagal. Silakan periksa log Jenkins.'
        }

        always {
            echo 'Pipeline selesai dijalankan.'
        }
    }
}