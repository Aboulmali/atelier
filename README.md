# aws-automation

Petit portail Flask qui déclenche un workflow GitHub Actions pour appliquer Terraform et créer une instance EC2.

## 1) Prérequis

- Python 3.10+
- Un repo GitHub contenant ce code et le workflow `.github/workflows/terraform.yml`
- Des credentials AWS (IAM user) avec droits EC2

## 2) Configuration (local)

Crée/édite un fichier `.env` à la racine :

- `GITHUB_TOKEN` : un **Personal Access Token** (fine-grained ou classic) autorisé à déclencher le workflow
- `GITHUB_OWNER` : owner du repo (ex: `MonOrg`)
- `GITHUB_REPO` : nom du repo (ex: `aws-automation`)
- (optionnel) `GITHUB_WORKFLOW_FILE` : par défaut `terraform.yml`
- (optionnel) `GITHUB_REF` : par défaut `main`

Pour exécuter Terraform en local (si besoin), exporte aussi :

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION` (optionnel, sinon Terraform utilise `var.region`)

## 3) Lancer l'app

```bash
python -m venv .venv
.venv\Scripts\pip install -r requirements.txt
.venv\Scripts\python app.py
```

Puis ouvre http://127.0.0.1:5000

## 4) Configuration GitHub Actions

Dans les **Secrets** du repo GitHub, ajoute :

- `AWS_ACCESS_KEY_ID` (ou `AWS_ACCESS_KEY`)
- `AWS_SECRET_ACCESS_KEY` (ou `AWS_SECRET_KEY`)

Le workflow est déclenché via `workflow_dispatch` et passe les variables Terraform via `TF_VAR_*`.

En plus, un job `validate` tourne automatiquement sur `push`/`pull_request` (init + validate) pour que tu voies tout de suite des runs dans l'onglet Actions sans créer de ressources.

## Note importante (state Terraform)

Actuellement, l'état Terraform n'est pas stocké dans un backend distant. Sur GitHub Actions, l'état est perdu à chaque run, donc les runs suivants peuvent recréer des ressources.

Pour un usage sérieux : configure un backend S3+DynamoDB.
