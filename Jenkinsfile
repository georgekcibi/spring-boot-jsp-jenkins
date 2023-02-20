pipeline {
    agent {
        label 'node1'
    }

    stages {

        stage ('Deleting the current contents') {
            steps {
                sh 'rm -rf /var/lib/jenkins/workspace/Pipeline/*'
            }
        }

        stage ('Killing the old process') {
            steps {
                sh 'sudo kill -9 $(lsof -i:8082 -t) || true'
            }
        }

        stage ('Maven test') {
            steps {
                sh 'cd /var/lib/jenkins/workspace/Pipeline'
                sh 'mvn test'
            }
        }

        stage ('Building JAR file') {
            steps {
                sh 'mvn package'
            }
        }

        stage ('Deploying the application') {
            steps {
                sh '''
                  cd /var/lib/jenkins/workspace/Pipeline
                  version=$(perl -nle 'print "$1" if /<version>(v\\d+\\.\\d+\\.\\d+)<\\/version>/' pom.xml)'
                  export JENKINS_NODE_COOKIE=dontKillMe && /usr/bin/java -jar -Dserver.port=8082 target/news-${version}.jar &
               '''
            }       

        }
    }

}
