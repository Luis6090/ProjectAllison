push_image:
	@echo "Pushing image to ECR"
	@docker build -t emotion-repo-ecr .
	@docker tag emotion-repo-ecr:latest 211125615805.dkr.ecr.us-east-1.amazonaws.com/emotion-repo-ecr:0.0.2
	@docker push 211125615805.dkr.ecr.us-east-1.amazonaws.com/emotion-repo-ecr:0.0.2