# Cluster Setup

gcloud container clusters create normunda \
          --region europe-central2 \
          --num-nodes=1 \
          --enable-autoscaling --max-nodes=6 --min-nodes=1 \
          --enable-ip-alias \
          --machine-type=n1-standard-16 \
          --disk-type "pd-ssd" \
          --spot \
          --maintenance-window=4:00 \
          --release-channel=regular \
          --cluster-version=latest
## Apply StorageClass

kubectl apply -f ../storageClass-gke.yaml

# Deployment:

