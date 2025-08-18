# MIGRATE_0.x.x to 1.0.0.md

## 🎯 Purpose
This document explains the structural and configuration changes between the old `values.yaml` and the new chart format for Kestra.  
It is intended to guide you through migrating existing deployments without losing functionality.

---

## 1. General Structure
- **Old**: many global parameters defined at the root level (`resources`, `affinity`, `extraEnv`, etc.).  
- **New**: these parameters are grouped under the `common.*` block.

✅ **Action**: move your global configurations under `common`.

---

## 2. Image
**Old:**
```yaml
image:
  image: kestra/kestra
  pullPolicy: Always
  tag: "1.0.0"
```

**New:**
```yaml
image:
  repository: kestra/kestra
  pullPolicy: IfNotPresent
  tag: "1.0.0"
```

---

## 3. Common Parameters
**Old:**
```yaml
resources: {}
affinity: {}
securityContext:
  runAsUser: 1000
  runAsGroup: 1000
```

**New:**
```yaml
common:
  resources: {}
  affinity: {}
  securityContext:
    runAsUser: 1000
    runAsGroup: 1000
```

---

## 4. Probes
**Old:**
```yaml
readinessProbe:
  enabled: true
  path: /health/readiness
  port: management
```

**New:**
```yaml
common:
  readinessProbe:
    httpGet:
      path: /health/readiness
      port: management
```

⚠️ The `enabled` flag has been removed. To disable a probe, remove or empty the corresponding block.

---

## 5. Kestra Configuration
**Old:**
```yaml
configuration: {}
secrets: {}
externalSecret: {}
configurationPath: /app/application.yml
```

**New:**
```yaml
configurations:
  application: {}
  configmaps: []
  secrets: []
```

---

## 6. Service Account
**Old:**
```yaml
serviceAccountName: my-sa
```

**New:**
```yaml
serviceAccount:
  create: true
  name: my-sa
  automount: true
  annotations: {}
```

---

## 7. Deployments
**Old:**
```yaml
deployments:
  worker:
    enabled: true
    resources: {}
    affinity: {}
    readinessProbe: {}
```

**New:**
```yaml
deployments:
  worker:
    enabled: true
    workerThreads: 128
    extraArgs: []
```

⚠️ Scheduling, probes, resources, and other detailed settings are now inherited from `common.*`.

---

## 8. Worker Groups
**Old:**
```yaml
workerGroup:
  group1:
    enabled: true
    workerThreads: 64
```

**New:**
```yaml
workerGroups:
  - name: group1
    enabled: true
    workerThreads: 64
```

---

## 9. Docker-in-Docker (dind)
**Old:**
```yaml
dind:
  enabled: true
  image:
    image: docker
    tag: dind-rootless
```

**New:**
```yaml
dind:
  enabled: true
  mode: rootless
  base:
    rootless:
      image:
        repository: docker
        tag: dind-rootless
```

---

## 10. Services
**Old:**
```yaml
service:
  type: ClusterIP
  port: 8080
  management:
    enabled: true
    port: 8081
```

**New:**
```yaml
service:
  type: ClusterIP
  ports:
    http:
      port: 8080
      containerPort: 8080
    management:
      port: 8081
      containerPort: 8081
```

---

## 11. Ingress
**Old:**
```yaml
ingress:
  enabled: true
  hosts:
    - host: chart-example.local
      paths:
        - path: /
          pathType: ImplementationSpecific
```

**New:**
```yaml
ingress:
  enabled: true
  hosts: []
```

⚠️ The default `chart-example.local` host has been removed.  
👉 You must explicitly define your own hosts.

---

## 12. Extras
- **Old**: `extraConfigMapEnvFrom` + `extraSecretEnvFrom`.  
- **New**: merged into `common.extraEnvFrom`.

- **Old**: `extraPorts`.  
- **New**: removed — use `service.ports` instead.

---

# ✅ Migration Checklist
1. Move all global values under `common.*`.
2. Review probes — `enabled` has been removed.
3. Migrate Kestra configuration into the new `configurations.*` structure.
4. Update WorkerGroups (`map` → `list`).
5. Adapt dind configuration with `mode: rootless` or `mode: insecure`.
6. Explicitly define Ingress hosts.
7. Adjust services to use the new `ports` structure.

---
