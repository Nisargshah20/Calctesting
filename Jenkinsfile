pipeline {
  
  environment {
    registry = "nisarg20/calctesting"
    registryCredential = 'dockerhub'
  }
  
  agent any
  stages {
          
    stage('Clean') {
        steps{    
            logstash{
                sh 'mvn clean'
                echo "clean"
            }
        }
    }
        
    stage('Compile') {
        steps{
            logstash{
                sh 'mvn package'
                echo "compile"
            }
        }
    }
    stage('Test') {
        steps{    
            logstash {
                sh 'mvn test'
                echo "test"
            }
        }
    }
    
    stage('Deploy Image') {
        steps{    
            logstash {
                script{
                   
                   dockerImage = docker.build registry + ":calc"
                   docker.withRegistry( '', registryCredential){
                   dockerImage.push()
                  }
                }
            }
        }
    }

    stage('Deploy') {
        steps {
    	  logstash{
                script {
                  step([$class: "RundeckNotifier",
                      includeRundeckLogs: true,
                      jobId: "51902630-4114-417e-b385-56ffb29fd72a",
                      rundeckInstance: "Rundeck",
                      shouldFailTheBuild: true,
                      shouldWaitForRundeckJob: true,
                      tailLog: true])
                }
           }
    	}
     }

  }
}
