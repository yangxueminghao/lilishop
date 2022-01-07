# Jenkins机器：编译完成后，build生成一个新版本的镜像，push到远程docker仓库



# Variables

JENKINS_WAR_HOME='/home/jenkins/.jenkins/workspace/godseyeBranchForNov/godseye-container/target'

DOCKERFILE_HOME='/home/jenkins/docker-file/godseye_war'

HARBOR_IP='172.16.206.32'

REPOSITORIES='godseye_war/godseye'

HARBOR_USER='jkzhao'

HARBOR_USER_PASSWD='Wisedu123'

HARBOR_USER_EMAIL='01115004@wisedu.com'



# Copy the newest war to docker-file directory.

\cp -f ${JENKINS_WAR_HOME}/godseye-container-wisedu.war ${DOCKERFILE_HOME}/godseye.war



# Delete image early version.

sudo docker login -u ${HARBOR_USER} -p ${HARBOR_USER_PASSWD} -e ${HARBOR_USER_EMAIL} ${HARBOR_IP}

IMAGE_ID=`sudo docker images | grep ${REPOSITORIES} | awk '{print $3}'`

if [ -n "${IMAGE_ID}" ];then

    sudo docker rmi ${IMAGE_ID}

fi



# Build image.

cd ${DOCKERFILE_HOME}

TAG=`date +%Y%m%d-%H%M%S`

sudo docker build -t ${HARBOR_IP}/${REPOSITORIES}:${TAG} . &>/dev/null



# Push to the harbor registry.

sudo docker push ${HARBOR_IP}/${REPOSITORIES}:${TAG} &>/dev/null

# 拉取镜像，发布

HARBOR_IP='172.16.206.32'

REPOSITORIES='godseye_war/godseye'

HARBOR_USER='jkzhao'

HARBOR_USER_PASSWD='Wisedu123'



# 登录harbor

#docker login -u ${HARBOR_USER} -p ${HARBOR_USER_PASSWD} ${HARBOR_IP}



# Stop container, and delete the container.

CONTAINER_ID=`docker ps | grep "godseye_web" | awk '{print $1}'`

if [ -n "$CONTAINER_ID" ]; then

    docker stop $CONTAINER_ID

    docker rm $CONTAINER_ID

else #如果容器启动时失败了，就需要docker ps -a才能找到那个容器

    CONTAINER_ID=`docker ps -a | grep "godseye_web" | awk '{print $1}'`

    if [ -n "$CONTAINER_ID" ]; then  # 如果是第一次在这台机器上拉取运行容器，那么docker ps -a也是找不到这个容器的

        docker rm $CONTAINER_ID

    fi

fi



# Delete godseye_web image early version.

IMAGE_ID=`sudo docker images | grep ${REPOSITORIES} | awk '{print $3}'`

if [ -n "${IMAGE_ID}" ];then

    docker rmi ${IMAGE_ID}

fi



# Pull image.

TAG=`curl -s http://${HARBOR_IP}/api/repositories/${REPOSITORIES}/tags | jq '.[-1]' | sed 's/\"//g'` #最后的sed是为了去掉tag前后的双引号

docker pull ${HARBOR_IP}/${REPOSITORIES}:${TAG} &>/dev/null



# Run.

docker run -d --name godseye_web -p 8080:8080 ${HARBOR_IP}/${REPOSITORIES}:${TAG}