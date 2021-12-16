pipeline {
    agent any
    environment {
	DOCKERHUB_CREDENTIALS=credentials('mohammedaminetrabzi-dockerhub')
	}

    stages{
    	stage('SonarQube Built-in Code analysis') {
        	steps { 	
		 def scannerHome = tool 'sonar'
       	         withSonarQubeEnv('sonar'){
               		sh "${scannerHome}/bin/sonar-scanner -Dsonar.host.url=http://141.95.160.233:9000/ -Dsonar.projectName=javaWebApp -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=jnknsSnrqb2  -Dsonar.sources=./ -Dsonar.language=java -Dsonar.java.binaries=."
                   }      
                }
	}

  	stage('Maven Compile &  Package'){
		steps{
     		def mvnHome = tool name: 'maven', type: 'maven'
     		sh "echo '${mvnHome}/bin/mvn' "
     		sh "${mvnHome}/bin/mvn clean compile package "
   		}
	}

   	stage('log-in'){
		steps{
			sh 'echo $DOCKERHUB_CREDENTIALS_PSW| docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
		}
     	}

   	stage('Push'){
		steps{
    			sh 'docker push mohammedaminetrabzi/docker_test'	
		}
   	}
     }
}
