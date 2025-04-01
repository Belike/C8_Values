### Database Setup to mimic managed Service
Apply Database Secret to Namespace 

    kubectl apply -f database/database-secrets.yaml -n $(namespace)

Then install postgresql:

    helm install my-postgresql bitnami/postgresql --namespace camunda -f database/dedicatedDatabase.yaml

Create custom Schema for Keycloak:

    create schema keycloak;

