pipeline {
    agent {
        docker { image 'node:14' }
    }
  environment {
    dockerimagename = "bravinwasike/react-app"
    dockerImage = ""
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
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }
    stage('Pushing Image') {
      environment {
          registryCredential = 'dockerhub-credentials'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Deploying React.js container to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deployment.yaml", 
                                         "service.yaml")
        }
      }
    }
  }
}