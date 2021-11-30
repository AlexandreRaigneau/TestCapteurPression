pipeline {
    agent any

    stages {
        stage('Run app') {
            steps {
                python app.py
            }
        }
        stage('Test with Robotframework') {
            steps {
                python -m robot test.robot
            }
        }
    }
}