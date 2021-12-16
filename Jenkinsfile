node {
    def app

    environment {
	DOCKERHUB_CREDENTIALS=credentials('mohammedaminetrabzi-dockerhub')
	}

    stage('SonarQube Built-in Code analysis') {
        def scannerHome = tool 'sonar'
        withSonarQubeEnv('sonar'){
               sh "${scannerHome}/bin/sonar-scanner -Dsonar.host.url=http://141.95.160.233:9000/ -Dsonar.projectName=javaWebApp -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=jnknsSnrqb2  -Dsonar.sources=./ -Dsonar.language=java -Dsonar.java.binaries=."
        }
    }

   stage('Maven Compile &  Package'){
     def mvnHome = tool name: 'maven', type: 'maven'
     sh "echo '${mvnHome}/bin/mvn' "
     sh "${mvnHome}/bin/mvn clean compile package "
   }

   stage('log-in'){
	sh 'echo $DOCKERHUB_CREDENTIALS_PSW| docker logn -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
     }

   stage('Push'){
    sh 'docker push mohammedaminetrabzi/docker_test'
	
   }
}
