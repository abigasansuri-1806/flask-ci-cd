
pipeline {

    agent none



    stages {

        stage('Build') {

            agent { label 'slave-node' }

            steps {

                checkout scm

                sh 'pip install -r requirements.txt'

            }

        }



        stage('Test') {

            agent { label 'slave-node' }

            steps {

                sh 'python3 -m unittest discover tests'

            }

        }



        stage('Deploy to Staging') {

            agent { label 'master' }

            steps {

                echo 'Deploying to staging...'

                sh './scripts/deploy_staging.sh'

            }

        }



        stage('Manual Approval') {

            steps {

                input message: 'Approve production deployment?'

            }

        }



        stage('Deploy to Production') {

            agent { label 'master' }

            steps {

                echo 'Deploying to production...'

                sh './scripts/deploy_production.sh'

            }

        }

    }



    post {

        success {

            echo 'Pipeline executed successfully.'

        }

        failure {

            echo 'Pipeline failed. Sending alert...'

        }

    }

}

