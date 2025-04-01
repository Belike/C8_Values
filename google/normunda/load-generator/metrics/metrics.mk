.PHONY: metrics
metrics:
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo add stable https://charts.helm.sh/stable
	helm repo update prometheus-community stable
	kubectl apply -f $(root)/metrics/grafana-secret.yml -n default
	helm install metrics prometheus-community/kube-prometheus-stack --wait --atomic -f prometheus-operator-values.yml --set prometheusOperator.tlsProxy.enabled=false --namespace default
	kubectl apply -f $(root)/metrics/grafana-load-balancer.yml -n default

.PHONY: clean-metrics
clean-metrics:
	-kubectl delete -f $(root)/metrics/grafana-load-balancer.yml -n default
	-helm uninstall metrics --namespace default
	-kubectl delete -f $(root)/metrics/grafana-secret.yml -n default
#	-kubectl delete -f $(include-dir)/ssd-storageclass.yaml -n default
	-kubectl delete pvc -l app.kubernetes.io/name=prometheus -n default
	-kubectl delete pvc -l app.kubernetes.io/name=grafana -n default