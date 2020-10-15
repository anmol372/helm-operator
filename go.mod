module github.com/joelanford/helm-operator

go 1.13

require (
	github.com/go-logr/logr v0.1.0
	github.com/onsi/ginkgo v1.12.1
	github.com/onsi/gomega v1.10.1
	github.com/operator-framework/operator-lib v0.1.0
	github.com/spf13/cobra v1.0.0
	github.com/spf13/pflag v1.0.5
	github.com/stretchr/testify v1.5.1
	gomodules.xyz/jsonpatch/v2 v2.0.1
	helm.sh/helm/v3 v3.2.4
	k8s.io/api v0.18.8
	k8s.io/apiextensions-apiserver v0.18.8
	k8s.io/apimachinery v0.18.8
	k8s.io/cli-runtime v0.18.8
	k8s.io/client-go v0.18.8
	k8s.io/kubectl v0.18.8
	rsc.io/letsencrypt v0.0.3 // indirect
	sigs.k8s.io/controller-runtime v0.6.3
	sigs.k8s.io/yaml v1.2.0
)
