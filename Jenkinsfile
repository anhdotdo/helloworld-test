node {
    stage("Git Clone"){

        git credentialsId: 'GIT_HUB_CREDENTIALS', url: 'https://github.com/anhdotdo/helloworld-test.git'
    }

    stage("Docker build"){
        sh 'whoami'
        sh 'sudo docker version'
        sh 'sudo docker build -t my-java-app .'
        sh 'sudo docker image list'
        sh 'sudo docker tag my-java-app anhdo98/my-java-app:v2'
    }

    withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
        sh 'sudo docker login -u anhdo98 -p $PASSWORD'
    }

    stage("Push Image to Docker Hub"){
        sh 'sudo docker push  anhdo98/my-java-app:v2'
    }
} 
