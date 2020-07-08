job("github-download") {
	description("Pull code from github")
	scm {
		github("AnonMrNone/k8s-jenkins-groovy","master")
	}
	triggers {
		githubPush()
	}
	steps {
		shell(readFileFromWorkspace("download.sh")
	}
}

job("classify-code") {
	description("classify code and deploy to testing env")
	scm {
		github("AnonMrNone/k8s-jenkins-groovy","master")
	}
	triggers {
		upstream("github-download",threshold = 'SUCCESS')
	}
	steps {
		shell(readFileFromWorkspace("classify.sh"))
	}
}

job("testing-deployment") {
	description("Testing the deployment")
	triggers {
		upstream("classify-code",threshold = 'SUCCESS')
	}
	steps {
		shell(readFileFromWorkspace("testing.sh")
	}
}

job("production-deployment") {
	description("Deploying on production environment")
	triggers {
		upstream("testing-deployment",threshold = 'SUCCESS')
	}
	steps {
		shell(readFileFromWorkspace("deployment.sh")
	}
}

buildPipelineView("k8s-jenkins-groovy") {
	title("deployment on k8s using jenkins DSL")
	selectedJob("github-download")
	alwaysAllowManualTrigger(true)
	displayedBuilds(1)
	showPipelineParameters(true)
}
