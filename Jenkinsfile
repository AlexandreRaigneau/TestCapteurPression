pipeline {
    agent any

    stages {
        stage('Run app') {
            steps {
                python3 app.py
            }
        }
        stage('Test with Robotframework') {
            steps {
                python3 -m robot test.robot
            }
        }
    }
}