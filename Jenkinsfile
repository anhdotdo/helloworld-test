node {
    stage("Git Clone"){

        git credentialsId: 'GIT_HUB_CREDENTIALS', url: 'https://github.com/anhdotdo/helloworld-test.git'
    }

    stage("Docker build"){
        sh 'whoami'
        sh 'sudo docker version'
        sh 'sudo docker build -t my-java-app .'
        sh 'sudo docker image list'
        sh 'sudo docker tag my-java-app anhdo98/my-java-app:v4'
    }

    withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
        sh 'sudo docker login -u anhdo98 -p $PASSWORD'
    }

    stage("Push Image to Docker Hub"){
        sh 'sudo docker push  anhdo98/my-java-app:v4'
    }

    stage("Run docker container"){
	sh 'sudo docker run my-java-app:latest'
    }
	
    stage("Deploy container into remote server"){
	def dockerRun = 'docker run -p 8088:8080 -d --name my-app anhdo98/my-java-app:v4'
	sshagent(['dev-server']){
		sh "ssh -o StrictHostKeyChecking=no ec2-user@52.79.49.13 ${dockerRun}"
	}
    }
} 
