pipeline {
agent any

```
environment {
    IMAGE_NAME = "pyoawndi12/student-devops-laravel-semple"
    IMAGE_TAG = "${BUILD_NUMBER}"

    DOCKERHUB_CREDENTIALS = credentials("dockerhub-credentials")
}

stages {

    stage("Checkout") {
        steps {
            checkout scm
        }
    }

    stage("Build Docker Image") {
        steps {
            sh """
                docker build \
                    -t ${IMAGE_NAME}:${IMAGE_TAG} \
                    -t ${IMAGE_NAME}:latest \
                    .
            """
        }
    }

    stage("Push Docker Image") {
        steps {
            sh """
                echo "${DOCKERHUB_CREDENTIALS_PSW}" | \
                docker login \
                    --username "${DOCKERHUB_CREDENTIALS_USR}" \
                    --password-stdin

                docker push ${IMAGE_NAME}:${IMAGE_TAG}
                docker push ${IMAGE_NAME}:latest

                docker logout
            """
        }
    }

    stage("Laravel Migration") {
        steps {
            withCredentials([
                file(
                    credentialsId: "laravel-semple-production-env",
                    variable: "ENV_FILE"
                )
            ]) {
                sh """
                    docker run --rm 
                    --env-file "${ENV_FILE}" 
                    ${IMAGE_NAME}:${IMAGE_TAG} 
                    php artisan migrate --force
                """
                }
            }
        }


    stage("Deploy to MIG") {
        steps {
            sh """
                gcloud compute instance-groups managed \
                    rolling-action replace \
                    portfolio-mig \
                    --region=asia-southeast2 \
                    --max-surge=1 \
                    --max-unavailable=0
            """
        }
    }
}

post {
    success {
        echo "CI/CD berhasil. Laravel telah dideploy ke portfolio-mig."
    }

    failure {
        echo "CI/CD gagal. Periksa Console Output Jenkins."
    }

    always {
        sh "docker image prune -f || true"
    }
}
```

}
