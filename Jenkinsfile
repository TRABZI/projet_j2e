node {
    def app

    stage('Clone repository') {
        	git 'https://gitlab.com/khlifidev1/projet_j2e'
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

   stage('Build Dockerfile image'){
        docker.withRegistry('https://id.docker.com/', 'f5201b2e-4d26-4fba-9a2c-32f35d896597') {
		 app = docker.build("mohammedaminetrabzi/tomcat")


              docker.image('tomcat:9.0').withrun(' -p 8880:80') { c ->
                   sh 'docker ps'
                   sh 'curl localhost'
                }
    app.push()

    }

  }
}
