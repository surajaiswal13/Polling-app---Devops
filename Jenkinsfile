pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                sh 'venv/bin/pip3 install -r requirements.txt'
            }
        }
        stage('Test') { 
            steps {
                sh 'venv/bin/python3 manage.py test'
            }
        }
        stage('Deploy To Stagging') { 
            steps {
                sh 'ssh -o StrictHostKeyChecking=no deployment-user@192.168.56.106 "source venv/bin/activate; \
                cd polling; \
                git pull origin master; \
                pip install -r requirements.txt --no-warn-script-location; \
                python manage.py migrate; \
                deactivate; \
                sudo systemctl restart nginx; \
                sudo systemctl restart gunicorn; \
                "'
            }
        }
        stage('Deploy To Production') {
            input {
                message "Shall we deploy to prduction ?"
                ok "Yes Please !"
            } 
            steps {
                sh 'ssh -o StrictHostKeyChecking=no deployment-user@192.168.56.101 "source venv/bin/activate; \
                cd polling; \
                git pull origin master; \
                pip install -r requirements.txt --no-warn-script-location; \
                python manage.py migrate; \
                deactivate; \
                sudo systemctl restart nginx; \
                sudo systemctl restart gunicorn; \
                "'
            }
        }
    }
}