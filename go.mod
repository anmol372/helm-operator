module github.com/joelanford/helm-operator

go 1.13

require (
	github.com/go-logr/logr v0.1.0
	github.com/iancoleman/strcase v0.1.2
	github.com/kr/text v0.1.0
	github.com/onsi/ginkgo v1.12.1
	github.com/onsi/gomega v1.10.1
	github.com/operator-framework/api v0.3.13
	github.com/operator-framework/operator-lib v0.1.0
	github.com/operator-framework/operator-sdk v1.1.0
	github.com/sirupsen/logrus v1.6.0
	github.com/spf13/afero v1.2.2
	github.com/spf13/cobra v1.0.0
	github.com/spf13/pflag v1.0.5
	github.com/stretchr/testify v1.6.1
	go.uber.org/zap v1.13.0
	golang.org/x/tools v0.0.0-20200403190813-44a64ad78b9b
	gomodules.xyz/jsonpatch/v2 v2.0.1
	helm.sh/helm/v3 v3.3.4
	k8s.io/api v0.18.8
	k8s.io/apiextensions-apiserver v0.18.8
	k8s.io/apimachinery v0.18.8
	k8s.io/cli-runtime v0.18.8
	k8s.io/client-go v0.18.8
	k8s.io/klog v1.0.0
	k8s.io/kubectl v0.18.8
	rsc.io/letsencrypt v0.0.3 // indirect
	sigs.k8s.io/controller-runtime v0.6.2
	sigs.k8s.io/kubebuilder v1.0.9-0.20201021204649-36124ae2e027
	sigs.k8s.io/yaml v1.2.0
)
