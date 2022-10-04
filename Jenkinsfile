pipeline {
    agent {
        any {
            args '-p 3000:3000 -p 5000:5000' 
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Start pipleine') {
            steps {
                echo "this is the first step of the build"
                echo " start building"
                script {
                        env.GIT_HASH = sh(
                                script: "git show --oneline | head -1 | cut -d' ' -f1",
                                returnStdout: true
                                ).trim()
                        echo env.GIT_HASH
                }
            }
        }
        stage('build-frontend') {
            steps {
                dir('./src/frontend') {
                    sh "pwd"
                    sh 'node --version'
                    sh 'npm cache clean --force'
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        stage('build-backend') {
            steps {
                dir('./src/backend') {
                    sh "pwd"
                    sh 'npm install'
                }
            }
        }
        stage('Linting') {
            steps {
                echo "Linting Docker File"
                sh 'wget -O hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64 &&\
                            chmod +x hadolint'
                sh 'make lint'
            }
        }
        stage('Build Docker Image') {
            steps {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
            
            sh '''
                docker build -t mersileatti/devopscapstone:$BUILD_ID .
            '''
            sh 'docker image ls'
                }
            }
        }
    }
}