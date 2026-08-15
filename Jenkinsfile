pipeline {
    agent any

    environment {
        APP_NAME = 'laravel-app'
        IMAGE_TAG = "${BUILD_NUMBER}"

        GCP_PROJECT_ID = 'project-56b2f5d2-7168-44bb-ab5'
        GCP_REGION = 'asia-southeast2'
        AR_REPOSITORY = 'laravel-dev'
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
        stage('Push to Artifact Registry') {
            steps {
                echo 'Push Docker image ke Artifact Registry...'

                sh '''
                    gcloud auth configure-docker \
                        ${GCP_REGION}-docker.pkg.dev \
                        --quiet

                    # Tag BUILD_NUMBER
                    docker tag \
                        ${APP_NAME}:${IMAGE_TAG} \
                        ${GCP_REGION}-docker.pkg.dev/${GCP_PROJECT_ID}/${AR_REPOSITORY}/${APP_NAME}:${IMAGE_TAG}

                    # Tag latest
                    docker tag \
                        ${APP_NAME}:${IMAGE_TAG} \
                        ${GCP_REGION}-docker.pkg.dev/${GCP_PROJECT_ID}/${AR_REPOSITORY}/${APP_NAME}:latest

                    # Push BUILD_NUMBER
                    docker push \
                        ${GCP_REGION}-docker.pkg.dev/${GCP_PROJECT_ID}/${AR_REPOSITORY}/${APP_NAME}:${IMAGE_TAG}

                    # Push latest
                    docker push \
                        ${GCP_REGION}-docker.pkg.dev/${GCP_PROJECT_ID}/${AR_REPOSITORY}/${APP_NAME}:latest
                '''
            }
        }
        stage('Deploy to GKE') {
            steps {
                echo "Deploy Laravel image ${IMAGE_TAG} ke GKE..."

                sh '''
                    IMAGE="${GCP_REGION}-docker.pkg.dev/${GCP_PROJECT_ID}/${AR_REPOSITORY}/${APP_NAME}:${IMAGE_TAG}"

                    echo "Deploy image: ${IMAGE}"

                    kubectl set image deployment/laravel \
                        init-laravel=${IMAGE} \
                        php-fpm=${IMAGE} \
                        -n laravel-dev

                    kubectl rollout status deployment/laravel \
                        -n laravel-dev \
                        --timeout=180s
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