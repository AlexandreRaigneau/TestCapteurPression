pipeline {
    agent any

    stages {
        parallel firstBranch: {
            stage('Run app') {
                steps {
                    python3 app.py
                }
            }
        }, secondBranch: {
           stage('Test with Robotframework') {
               steps {
                   python3 -m robot test.robot
                }
            }
        }  
    }
}