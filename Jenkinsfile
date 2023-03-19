#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('K8s/descriptors') {
                        sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                        sh "kubectl apply -f cart-deployment.yaml"
                        sh "kubectl apply -f cart-service.yaml"
                        sh "kubectl apply -f catalogue-deployment.yaml"
                        sh "kubectl apply -f catalogue-service.yaml"
                        sh "kubectl apply -f dispatch-deployment.yaml"
                        sh "kubectl apply -f dispatch-service.yaml"
                        sh "kubectl apply -f mongodb-deployment.yaml"
                        sh "kubectl apply -f mongodb-service.yaml"
                        sh "kubectl apply -f mysql-deployment.yaml"
                        sh "kubectl apply -f mysql-service.yaml"
                        sh "kubectl apply -f payment-deployment.yaml"
                        sh "kubectl apply -f payment-service.yaml"
                        sh "kubectl apply -f rabbitmq-deployment.yaml"
                        sh "kubectl apply -f rabbitmq-service.yaml"
                        sh "kubectl apply -f ratings-deployment.yaml"
                        sh "kubectl apply -f ratings-service.yaml"
                        sh "kubectl apply -f redis-deployment.yaml"
                        sh "kubectl apply -f redis-service.yaml"
                        sh "kubectl apply -f shipping-deployment.yaml"
                        sh "kubectl apply -f shipping-service.yaml"
                        sh "kubectl apply -f user-deployment.yaml"
                        sh "kubectl apply -f user-service.yaml"
                        sh "kubectl apply -f web-deployment.yaml"
                        sh "kubectl apply -f web-service.yaml"

                        
                    }
                }
            }
        }
    }
}