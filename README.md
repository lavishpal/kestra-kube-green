# 🌿 kube-green Automation with Kestra

Automate `kube-green` sleep schedules in Kubernetes using [Kestra](https://kestra.io), with daily flows that apply `SleepInfo` CRDs and notify via Slack.

---

## 📁 Project Structure
```
.
├── Dockerfile                     # Custom Kestra container (optional)
├── docker-compose.yml             # Run Kestra locally
├── README.md                      # You're here
├── flows/
│   └── kube-green-scheduler.yaml  # Main Kestra flow
├── configs/
│   └── sample-sleepinfo.json      # Example input config
└── .github/
    └── workflows/
        └── deploy.yml             # CI to deploy flow via Kestra CLI
```

---

## 🚀 Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/your-username/kestra-kube-green.git
cd kestra-kube-green
```

### 2. Start Kestra locally
```bash
docker-compose up -d
```

Visit `http://localhost:8080` — default login: `admin` / `admin`

### 3. Upload the Flow
Once inside Kestra UI:
- Navigate to **Flows → Import**
- Upload `flows/kube-green-scheduler.yaml`

Or via CLI:
```bash
kestra flow create flows/kube-green-scheduler.yaml
```

### 4. Trigger the Flow
Run manually, or wait for the scheduled cron (`8:00 UTC daily`)

---

## 🔐 Secrets Required
Add these secrets in your Kestra instance (or CI):
- `SLACK_WEBHOOK_URL`
- `KESTRA_API_URL`
- `KESTRA_API_USERNAME`
- `KESTRA_API_PASSWORD`

---

## ✅ Example Schedule Config (host externally)
```json
{
  "timeZone": "Europe/Rome",
  "weekdays": "1-5",
  "sleepAt": "20:00",
  "wakeUpAt": "08:00",
  "suspendCronJobs": true,
  "excludeRef": [
    { "apiVersion": "apps/v1", "kind": "Deployment", "name": "my-deployment" }
  ]
}
```

---

## 📄 License
MIT
