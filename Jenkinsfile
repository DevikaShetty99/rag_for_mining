pipeline {
    agent any
    environment {
        dockerimagename = "bravinwasike/react-app"
    }
    stages {
        stage('Checkout Source') {
            steps {
                git branch: 'main', 
                    credentialsId: 'github-credentials', 
                    url: 'https://github.com/DevikaShetty99/rag_for_mining.git'
            }
        }
        stage('Build image') {
            steps {
                script {
                    sh "docker build -t ${dockerimagename} ."
                }
            }
        }
        stage('Pushing Image') {
            environment {
                registryCredential = 'dockerhub-credentials'
            }
            steps {
                script {
                    sh "echo '${registryCredential}' | docker login -u 'your-dockerhub-username' --password-stdin"
                    sh "docker push ${dockerimagename}:latest"
                }
            }
        }
        stage('Deploying React.js container to Kubernetes') {
            steps {
                script {
                    sh "kubectl apply -f deployment.yaml"
                    sh "kubectl apply -f service.yaml"
                }
            }
        }
    }
}
