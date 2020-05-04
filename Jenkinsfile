pipeline {
  
  environment {
    registry = "nisarg20/calc"
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
    
    }
}
