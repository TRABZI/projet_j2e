pipeline { 
    environment { 
        registry = "mohammedaminetrabzi/docker_test" 
        registryCredential = 'mohammedaminetrabzi-dockerhub' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Build image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
